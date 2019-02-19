//===-- EBCMCCodeEmitter.cpp - Convert EBC code to machine code -------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file implements the EBCMCCodeEmitter class.
//
//===----------------------------------------------------------------------===//

#include "MCTargetDesc/EBCMCTargetDesc.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/MC/MCAsmInfo.h"
#include "llvm/MC/MCCodeEmitter.h"
#include "llvm/MC/MCContext.h"
#include "llvm/MC/MCExpr.h"
#include "llvm/MC/MCInst.h"
#include "llvm/MC/MCInstrInfo.h"
#include "llvm/MC/MCRegisterInfo.h"
#include "llvm/MC/MCSymbol.h"
#include "llvm/Support/EndianStream.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

#define DEBUG_TYPE "mccodeemitter"

STATISTIC(MCNumEmitted, "Number of MC instructions emitted");

namespace {

class EBCMCCodeEmitter : public MCCodeEmitter {
  EBCMCCodeEmitter(const EBCMCCodeEmitter &) = delete;
  void operator=(const EBCMCCodeEmitter &) = delete;
  MCContext &Ctx;
  MCInstrInfo const &MCII;

public:
  EBCMCCodeEmitter(MCContext &ctx, MCInstrInfo const &MCII)
    : Ctx(ctx), MCII(MCII) {}

  ~EBCMCCodeEmitter() override {}

  void encodeInstruction(const MCInst &MI, raw_ostream &OS,
                         SmallVectorImpl<MCFixup> &Fixups,
                         const MCSubtargetInfo &STI) const override;

  /// TableGen'erated function for getting the binary encoding for an
  /// instruction.
  uint64_t getBinaryCodeForInstr(const MCInst &MI,
                                 SmallVectorImpl<MCFixup> &Fixups,
                                 const MCSubtargetInfo &STI) const;

  /// Return binary encoding of operand. If the machine operand requires
  /// relocation, record the relocation and return zero.
  unsigned getMachineOpValue(const MCInst &MI, const MCOperand &MO,
                             SmallVectorImpl<MCFixup> &Fixups,
                             const MCSubtargetInfo &STI) const;

  uint16_t getIdx16Value(const MCOperand &NMO, const MCOperand &CMO) const;

};

} // end anonymous namespace

MCCodeEmitter *llvm::createEBCMCCodeEmitter(const MCInstrInfo &MCII,
                                              const MCRegisterInfo &MRI,
                                              MCContext &Ctx) {
  return new EBCMCCodeEmitter(Ctx, MCII);
}

void EBCMCCodeEmitter::encodeInstruction(const MCInst &MI, raw_ostream &OS,
                                           SmallVectorImpl<MCFixup> &Fixups,
                                           const MCSubtargetInfo &STI) const {
  const MCInstrDesc &Desc = MCII.get(MI.getOpcode());
  // Get byte count of instruction
  unsigned Size = Desc.getSize();

  switch (Size) {
  default:
    llvm_unreachable("Unhandled encodeInstruction length!");
  case 1: {
    uint8_t Bits = getBinaryCodeForInstr(MI, Fixups, STI);
    support::endian::write<uint8_t>(OS, Bits, support::little);
    break;
  }
  case 2: {
    uint16_t Bits = getBinaryCodeForInstr(MI, Fixups, STI);
    support::endian::write<uint16_t>(OS, Bits, support::little);
    break;
  }
  }

  for (unsigned I = 0, E = MI.getNumOperands(); I < E; ++I) {
    const MCOperand &MO = MI.getOperand(I);
    if (MO.isReg()) {
      /* nothing to encode */
    } else if (MO.isImm()) {
      const MCOperandInfo &Info = Desc.OpInfo[I];
      switch (Info.OperandType) {
      case EBC::OPERAND_BREAKCODE:
        support::endian::write<uint8_t>(OS, MO.getImm(), support::little);
        break;
      case EBC::OPERAND_IMM16:
        support::endian::write<uint16_t>(OS, MO.getImm(), support::little);
        break;
      case EBC::OPERAND_IDXN16: {
          // Assume next operand is OPERAND_IDXC16
          const MCOperand &CMO = MI.getOperand(I + 1);
          uint16_t Index = getIdx16Value(MO, CMO);
          support::endian::write<uint16_t>(OS, Index, support::little);
          // Skip next operand
          ++I;
          break;
        }
      case EBC::OPERAND_IDXC16:
        // It must not be occurred
        break;
      default:
        llvm_unreachable("Unhandled OperandType!");
      }
    }
  }

  ++MCNumEmitted; // Keep track of the # of mi's emitted.
}

unsigned
EBCMCCodeEmitter::getMachineOpValue(const MCInst &MI, const MCOperand &MO,
                                      SmallVectorImpl<MCFixup> &Fixups,
                                      const MCSubtargetInfo &STI) const {

  if (MO.isReg())
    return Ctx.getRegisterInfo()->getEncodingValue(MO.getReg());

  if (MO.isImm())
    return static_cast<unsigned>(MO.getImm());

  llvm_unreachable("Unhandled expression!");
  return 0;
}

uint16_t
EBCMCCodeEmitter::getIdx16Value(const MCOperand &NMO, const MCOperand &CMO) const {
  // TODO: Add validations and encodings
  uint16_t Index = NMO.getImm() & CMO.getImm();
  return Index;
}

#include "EBCGenMCCodeEmitter.inc"
