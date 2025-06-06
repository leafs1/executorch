# automatically generated by the FlatBuffers compiler, do not modify

# namespace: tflite

import flatbuffers
from flatbuffers.compat import import_numpy

np = import_numpy()


class UniqueOptions(object):
    __slots__ = ["_tab"]

    @classmethod
    def GetRootAs(cls, buf, offset=0):
        n = flatbuffers.encode.Get(flatbuffers.packer.uoffset, buf, offset)
        x = UniqueOptions()
        x.Init(buf, n + offset)
        return x

    @classmethod
    def GetRootAsUniqueOptions(cls, buf, offset=0):
        """This method is deprecated. Please switch to GetRootAs."""
        return cls.GetRootAs(buf, offset)

    @classmethod
    def UniqueOptionsBufferHasIdentifier(cls, buf, offset, size_prefixed=False):
        return flatbuffers.util.BufferHasIdentifier(
            buf, offset, b"\x54\x46\x4C\x33", size_prefixed=size_prefixed
        )

    # UniqueOptions
    def Init(self, buf, pos):
        self._tab = flatbuffers.table.Table(buf, pos)

    # UniqueOptions
    def IdxOutType(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(4))
        if o != 0:
            return self._tab.Get(flatbuffers.number_types.Int8Flags, o + self._tab.Pos)
        return 2


def UniqueOptionsStart(builder):
    builder.StartObject(1)


def Start(builder):
    UniqueOptionsStart(builder)


def UniqueOptionsAddIdxOutType(builder, idxOutType):
    builder.PrependInt8Slot(0, idxOutType, 2)


def AddIdxOutType(builder, idxOutType):
    UniqueOptionsAddIdxOutType(builder, idxOutType)


def UniqueOptionsEnd(builder):
    return builder.EndObject()


def End(builder):
    return UniqueOptionsEnd(builder)
