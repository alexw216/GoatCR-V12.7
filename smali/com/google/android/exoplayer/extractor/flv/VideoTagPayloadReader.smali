.class final Lcom/google/android/exoplayer/extractor/flv/VideoTagPayloadReader;
.super Lcom/google/android/exoplayer/extractor/flv/TagPayloadReader;
.source "VideoTagPayloadReader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/extractor/flv/VideoTagPayloadReader$AvcSequenceHeaderData;
    }
.end annotation


# static fields
.field private static final AVC_PACKET_TYPE_AVC_NALU:I = 0x1

.field private static final AVC_PACKET_TYPE_SEQUENCE_HEADER:I = 0x0

.field private static final VIDEO_CODEC_AVC:I = 0x7

.field private static final VIDEO_FRAME_KEYFRAME:I = 0x1

.field private static final VIDEO_FRAME_VIDEO_INFO:I = 0x5


# instance fields
.field private frameType:I

.field private hasOutputFormat:Z

.field private final nalLength:Lcom/google/android/exoplayer/util/ParsableByteArray;

.field private final nalStartCode:Lcom/google/android/exoplayer/util/ParsableByteArray;

.field private nalUnitLengthFieldLength:I


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/extractor/TrackOutput;)V
    .locals 2
    .param p1, "output"    # Lcom/google/android/exoplayer/extractor/TrackOutput;

    .prologue
    .line 61
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/extractor/flv/TagPayloadReader;-><init>(Lcom/google/android/exoplayer/extractor/TrackOutput;)V

    .line 62
    new-instance v0, Lcom/google/android/exoplayer/util/ParsableByteArray;

    sget-object v1, Lcom/google/android/exoplayer/util/NalUnitUtil;->NAL_START_CODE:[B

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>([B)V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/flv/VideoTagPayloadReader;->nalStartCode:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 63
    new-instance v0, Lcom/google/android/exoplayer/util/ParsableByteArray;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/flv/VideoTagPayloadReader;->nalLength:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 64
    return-void
.end method

.method private parseAvcCodecPrivate(Lcom/google/android/exoplayer/util/ParsableByteArray;)Lcom/google/android/exoplayer/extractor/flv/VideoTagPayloadReader$AvcSequenceHeaderData;
    .locals 13
    .param p1, "buffer"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    const/4 v12, 0x0

    .line 147
    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 148
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v0

    and-int/lit8 v0, v0, 0x3

    add-int/lit8 v2, v0, 0x1

    .line 149
    .local v2, "nalUnitLengthFieldLength":I
    const/4 v0, 0x3

    if-eq v2, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 150
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 151
    .local v1, "initializationData":Ljava/util/List;, "Ljava/util/List<[B>;"
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v0

    and-int/lit8 v9, v0, 0x1f

    .line 152
    .local v9, "numSequenceParameterSets":I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_1
    if-ge v6, v9, :cond_1

    .line 153
    invoke-static {p1}, Lcom/google/android/exoplayer/util/NalUnitUtil;->parseChildNalUnit(Lcom/google/android/exoplayer/util/ParsableByteArray;)[B

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 152
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .end local v1    # "initializationData":Ljava/util/List;, "Ljava/util/List<[B>;"
    .end local v6    # "i":I
    .end local v9    # "numSequenceParameterSets":I
    :cond_0
    move v0, v12

    .line 149
    goto :goto_0

    .line 155
    .restart local v1    # "initializationData":Ljava/util/List;, "Ljava/util/List<[B>;"
    .restart local v6    # "i":I
    .restart local v9    # "numSequenceParameterSets":I
    :cond_1
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v8

    .line 156
    .local v8, "numPictureParameterSets":I
    const/4 v7, 0x0

    .local v7, "j":I
    :goto_2
    if-ge v7, v8, :cond_2

    .line 157
    invoke-static {p1}, Lcom/google/android/exoplayer/util/NalUnitUtil;->parseChildNalUnit(Lcom/google/android/exoplayer/util/ParsableByteArray;)[B

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 156
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 160
    :cond_2
    const/high16 v5, 0x3f800000    # 1.0f

    .line 161
    .local v5, "pixelWidthAspectRatio":F
    const/4 v3, -0x1

    .line 162
    .local v3, "width":I
    const/4 v4, -0x1

    .line 163
    .local v4, "height":I
    if-lez v9, :cond_3

    .line 165
    new-instance v11, Lcom/google/android/exoplayer/util/ParsableBitArray;

    invoke-interface {v1, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    invoke-direct {v11, v0}, Lcom/google/android/exoplayer/util/ParsableBitArray;-><init>([B)V

    .line 167
    .local v11, "spsDataBitArray":Lcom/google/android/exoplayer/util/ParsableBitArray;
    add-int/lit8 v0, v2, 0x1

    mul-int/lit8 v0, v0, 0x8

    invoke-virtual {v11, v0}, Lcom/google/android/exoplayer/util/ParsableBitArray;->setPosition(I)V

    .line 168
    invoke-static {v11}, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil;->parseSpsNalUnit(Lcom/google/android/exoplayer/util/ParsableBitArray;)Lcom/google/android/exoplayer/util/CodecSpecificDataUtil$SpsData;

    move-result-object v10

    .line 169
    .local v10, "sps":Lcom/google/android/exoplayer/util/CodecSpecificDataUtil$SpsData;
    iget v3, v10, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil$SpsData;->width:I

    .line 170
    iget v4, v10, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil$SpsData;->height:I

    .line 171
    iget v5, v10, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil$SpsData;->pixelWidthAspectRatio:F

    .line 174
    .end local v10    # "sps":Lcom/google/android/exoplayer/util/CodecSpecificDataUtil$SpsData;
    .end local v11    # "spsDataBitArray":Lcom/google/android/exoplayer/util/ParsableBitArray;
    :cond_3
    new-instance v0, Lcom/google/android/exoplayer/extractor/flv/VideoTagPayloadReader$AvcSequenceHeaderData;

    invoke-direct/range {v0 .. v5}, Lcom/google/android/exoplayer/extractor/flv/VideoTagPayloadReader$AvcSequenceHeaderData;-><init>(Ljava/util/List;IIIF)V

    return-object v0
.end method


# virtual methods
.method protected parseHeader(Lcom/google/android/exoplayer/util/ParsableByteArray;)Z
    .locals 6
    .param p1, "data"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/extractor/flv/TagPayloadReader$UnsupportedFormatException;
        }
    .end annotation

    .prologue
    .line 73
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v1

    .line 74
    .local v1, "header":I
    shr-int/lit8 v3, v1, 0x4

    and-int/lit8 v0, v3, 0xf

    .line 75
    .local v0, "frameType":I
    and-int/lit8 v2, v1, 0xf

    .line 77
    .local v2, "videoCodec":I
    const/4 v3, 0x7

    if-eq v2, v3, :cond_0

    .line 78
    new-instance v3, Lcom/google/android/exoplayer/extractor/flv/TagPayloadReader$UnsupportedFormatException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Video format not supported: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/google/android/exoplayer/extractor/flv/TagPayloadReader$UnsupportedFormatException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 80
    :cond_0
    iput v0, p0, Lcom/google/android/exoplayer/extractor/flv/VideoTagPayloadReader;->frameType:I

    .line 81
    const/4 v3, 0x5

    if-eq v0, v3, :cond_1

    const/4 v3, 0x1

    :goto_0
    return v3

    :cond_1
    const/4 v3, 0x0

    goto :goto_0
.end method

.method protected parsePayload(Lcom/google/android/exoplayer/util/ParsableByteArray;J)V
    .locals 22
    .param p1, "data"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p2, "timeUs"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    .line 86
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v19

    .line 87
    .local v19, "packetType":I
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedInt24()I

    move-result v15

    .line 88
    .local v15, "compositionTimeMs":I
    int-to-long v2, v15

    const-wide/16 v4, 0x3e8

    mul-long/2addr v2, v4

    add-long p2, p2, v2

    .line 90
    if-nez v19, :cond_1

    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/google/android/exoplayer/extractor/flv/VideoTagPayloadReader;->hasOutputFormat:Z

    if-nez v2, :cond_1

    .line 91
    new-instance v20, Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual/range {p1 .. p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->bytesLeft()I

    move-result v2

    new-array v2, v2, [B

    move-object/from16 v0, v20

    invoke-direct {v0, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>([B)V

    .line 92
    .local v20, "videoSequence":Lcom/google/android/exoplayer/util/ParsableByteArray;
    move-object/from16 v0, v20

    iget-object v2, v0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    const/4 v3, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->bytesLeft()I

    move-result v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readBytes([BII)V

    .line 94
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/extractor/flv/VideoTagPayloadReader;->parseAvcCodecPrivate(Lcom/google/android/exoplayer/util/ParsableByteArray;)Lcom/google/android/exoplayer/extractor/flv/VideoTagPayloadReader$AvcSequenceHeaderData;

    move-result-object v13

    .line 95
    .local v13, "avcData":Lcom/google/android/exoplayer/extractor/flv/VideoTagPayloadReader$AvcSequenceHeaderData;
    iget v2, v13, Lcom/google/android/exoplayer/extractor/flv/VideoTagPayloadReader$AvcSequenceHeaderData;->nalUnitLengthFieldLength:I

    move-object/from16 v0, p0

    iput v2, v0, Lcom/google/android/exoplayer/extractor/flv/VideoTagPayloadReader;->nalUnitLengthFieldLength:I

    .line 98
    const/4 v2, 0x0

    const-string v3, "video/avc"

    const/4 v4, -0x1

    const/4 v5, -0x1

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/extractor/flv/VideoTagPayloadReader;->getDurationUs()J

    move-result-wide v6

    iget v8, v13, Lcom/google/android/exoplayer/extractor/flv/VideoTagPayloadReader$AvcSequenceHeaderData;->width:I

    iget v9, v13, Lcom/google/android/exoplayer/extractor/flv/VideoTagPayloadReader$AvcSequenceHeaderData;->height:I

    iget-object v10, v13, Lcom/google/android/exoplayer/extractor/flv/VideoTagPayloadReader$AvcSequenceHeaderData;->initializationData:Ljava/util/List;

    const/4 v11, -0x1

    iget v12, v13, Lcom/google/android/exoplayer/extractor/flv/VideoTagPayloadReader$AvcSequenceHeaderData;->pixelWidthAspectRatio:F

    invoke-static/range {v2 .. v12}, Lcom/google/android/exoplayer/MediaFormat;->createVideoFormat(Ljava/lang/String;Ljava/lang/String;IIJIILjava/util/List;IF)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v16

    .line 102
    .local v16, "mediaFormat":Lcom/google/android/exoplayer/MediaFormat;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/flv/VideoTagPayloadReader;->output:Lcom/google/android/exoplayer/extractor/TrackOutput;

    move-object/from16 v0, v16

    invoke-interface {v2, v0}, Lcom/google/android/exoplayer/extractor/TrackOutput;->format(Lcom/google/android/exoplayer/MediaFormat;)V

    .line 103
    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/google/android/exoplayer/extractor/flv/VideoTagPayloadReader;->hasOutputFormat:Z

    .line 136
    .end local v13    # "avcData":Lcom/google/android/exoplayer/extractor/flv/VideoTagPayloadReader$AvcSequenceHeaderData;
    .end local v16    # "mediaFormat":Lcom/google/android/exoplayer/MediaFormat;
    .end local v20    # "videoSequence":Lcom/google/android/exoplayer/util/ParsableByteArray;
    :cond_0
    :goto_0
    return-void

    .line 104
    :cond_1
    const/4 v2, 0x1

    move/from16 v0, v19

    if-ne v0, v2, :cond_0

    .line 108
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/flv/VideoTagPayloadReader;->nalLength:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v0, v2, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    move-object/from16 v17, v0

    .line 109
    .local v17, "nalLengthData":[B
    const/4 v2, 0x0

    const/4 v3, 0x0

    aput-byte v3, v17, v2

    .line 110
    const/4 v2, 0x1

    const/4 v3, 0x0

    aput-byte v3, v17, v2

    .line 111
    const/4 v2, 0x2

    const/4 v3, 0x0

    aput-byte v3, v17, v2

    .line 112
    move-object/from16 v0, p0

    iget v2, v0, Lcom/google/android/exoplayer/extractor/flv/VideoTagPayloadReader;->nalUnitLengthFieldLength:I

    rsub-int/lit8 v18, v2, 0x4

    .line 116
    .local v18, "nalUnitLengthFieldLengthDiff":I
    const/4 v7, 0x0

    .line 118
    .local v7, "bytesWritten":I
    :goto_1
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->bytesLeft()I

    move-result v2

    if-lez v2, :cond_2

    .line 120
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/flv/VideoTagPayloadReader;->nalLength:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v2, v2, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/android/exoplayer/extractor/flv/VideoTagPayloadReader;->nalUnitLengthFieldLength:I

    move-object/from16 v0, p1

    move/from16 v1, v18

    invoke-virtual {v0, v2, v1, v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readBytes([BII)V

    .line 121
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/flv/VideoTagPayloadReader;->nalLength:Lcom/google/android/exoplayer/util/ParsableByteArray;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 122
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/flv/VideoTagPayloadReader;->nalLength:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v14

    .line 125
    .local v14, "bytesToWrite":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/flv/VideoTagPayloadReader;->nalStartCode:Lcom/google/android/exoplayer/util/ParsableByteArray;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 126
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/flv/VideoTagPayloadReader;->output:Lcom/google/android/exoplayer/extractor/TrackOutput;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/extractor/flv/VideoTagPayloadReader;->nalStartCode:Lcom/google/android/exoplayer/util/ParsableByteArray;

    const/4 v4, 0x4

    invoke-interface {v2, v3, v4}, Lcom/google/android/exoplayer/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer/util/ParsableByteArray;I)V

    .line 127
    add-int/lit8 v7, v7, 0x4

    .line 130
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/flv/VideoTagPayloadReader;->output:Lcom/google/android/exoplayer/extractor/TrackOutput;

    move-object/from16 v0, p1

    invoke-interface {v2, v0, v14}, Lcom/google/android/exoplayer/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer/util/ParsableByteArray;I)V

    .line 131
    add-int/2addr v7, v14

    goto :goto_1

    .line 133
    .end local v14    # "bytesToWrite":I
    :cond_2
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/extractor/flv/VideoTagPayloadReader;->output:Lcom/google/android/exoplayer/extractor/TrackOutput;

    move-object/from16 v0, p0

    iget v2, v0, Lcom/google/android/exoplayer/extractor/flv/VideoTagPayloadReader;->frameType:I

    const/4 v4, 0x1

    if-ne v2, v4, :cond_3

    const/4 v6, 0x1

    :goto_2
    const/4 v8, 0x0

    const/4 v9, 0x0

    move-wide/from16 v4, p2

    invoke-interface/range {v3 .. v9}, Lcom/google/android/exoplayer/extractor/TrackOutput;->sampleMetadata(JIII[B)V

    goto :goto_0

    :cond_3
    const/4 v6, 0x0

    goto :goto_2
.end method

.method public seek()V
    .locals 0

    .prologue
    .line 69
    return-void
.end method
