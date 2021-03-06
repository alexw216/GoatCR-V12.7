.class final Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;
.super Ljava/lang/Object;
.source "DashChunkSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/dash/DashChunkSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "PeriodHolder"
.end annotation


# instance fields
.field private availableEndTimeUs:J

.field private availableStartTimeUs:J

.field private drmInitData:Lcom/google/android/exoplayer/drm/DrmInitData;

.field private indexIsExplicit:Z

.field private indexIsUnbounded:Z

.field public final localIndex:I

.field public final representationHolders:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;",
            ">;"
        }
    .end annotation
.end field

.field private final representationIndices:[I

.field public final startTimeUs:J


# direct methods
.method public constructor <init>(ILcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;ILcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;)V
    .locals 14
    .param p1, "localIndex"    # I
    .param p2, "manifest"    # Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;
    .param p3, "manifestIndex"    # I
    .param p4, "selectedTrack"    # Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;

    .prologue
    .line 954
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 955
    iput p1, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->localIndex:I

    .line 957
    invoke-virtual/range {p2 .. p3}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;->getPeriod(I)Lcom/google/android/exoplayer/dash/mpd/Period;

    move-result-object v9

    .line 958
    .local v9, "period":Lcom/google/android/exoplayer/dash/mpd/Period;
    invoke-static/range {p2 .. p3}, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->getPeriodDurationUs(Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;I)J

    move-result-wide v4

    .line 959
    .local v4, "periodDurationUs":J
    iget-object v2, v9, Lcom/google/android/exoplayer/dash/mpd/Period;->adaptationSets:Ljava/util/List;

    invoke-static/range {p4 .. p4}, Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->access$600(Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;)I

    move-result v3

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;

    .line 960
    .local v0, "adaptationSet":Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;
    iget-object v10, v0, Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;->representations:Ljava/util/List;

    .line 962
    .local v10, "representations":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/dash/mpd/Representation;>;"
    iget-wide v2, v9, Lcom/google/android/exoplayer/dash/mpd/Period;->startMs:J

    const-wide/16 v12, 0x3e8

    mul-long/2addr v2, v12

    iput-wide v2, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->startTimeUs:J

    .line 963
    invoke-static {v0}, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->getDrmInitData(Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;)Lcom/google/android/exoplayer/drm/DrmInitData;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->drmInitData:Lcom/google/android/exoplayer/drm/DrmInitData;

    .line 965
    invoke-virtual/range {p4 .. p4}, Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->isAdaptive()Z

    move-result v2

    if-nez v2, :cond_1

    .line 966
    const/4 v2, 0x1

    new-array v2, v2, [I

    const/4 v3, 0x0

    invoke-static/range {p4 .. p4}, Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->access$100(Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;)Lcom/google/android/exoplayer/chunk/Format;

    move-result-object v11

    iget-object v11, v11, Lcom/google/android/exoplayer/chunk/Format;->id:Ljava/lang/String;

    invoke-static {v10, v11}, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->getRepresentationIndex(Ljava/util/List;Ljava/lang/String;)I

    move-result v11

    aput v11, v2, v3

    iput-object v2, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->representationIndices:[I

    .line 976
    :cond_0
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->representationHolders:Ljava/util/HashMap;

    .line 977
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    iget-object v2, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->representationIndices:[I

    array-length v2, v2

    if-ge v7, v2, :cond_2

    .line 978
    iget-object v2, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->representationIndices:[I

    aget v2, v2, v7

    invoke-interface {v10, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/android/exoplayer/dash/mpd/Representation;

    .line 979
    .local v6, "representation":Lcom/google/android/exoplayer/dash/mpd/Representation;
    new-instance v1, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;

    iget-wide v2, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->startTimeUs:J

    invoke-direct/range {v1 .. v6}, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;-><init>(JJLcom/google/android/exoplayer/dash/mpd/Representation;)V

    .line 981
    .local v1, "representationHolder":Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;
    iget-object v2, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->representationHolders:Ljava/util/HashMap;

    iget-object v3, v6, Lcom/google/android/exoplayer/dash/mpd/Representation;->format:Lcom/google/android/exoplayer/chunk/Format;

    iget-object v3, v3, Lcom/google/android/exoplayer/chunk/Format;->id:Ljava/lang/String;

    invoke-virtual {v2, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 977
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 969
    .end local v1    # "representationHolder":Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;
    .end local v6    # "representation":Lcom/google/android/exoplayer/dash/mpd/Representation;
    .end local v7    # "i":I
    :cond_1
    invoke-static/range {p4 .. p4}, Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->access$000(Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;)[Lcom/google/android/exoplayer/chunk/Format;

    move-result-object v2

    array-length v2, v2

    new-array v2, v2, [I

    iput-object v2, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->representationIndices:[I

    .line 970
    const/4 v8, 0x0

    .local v8, "j":I
    :goto_1
    invoke-static/range {p4 .. p4}, Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->access$000(Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;)[Lcom/google/android/exoplayer/chunk/Format;

    move-result-object v2

    array-length v2, v2

    if-ge v8, v2, :cond_0

    .line 971
    iget-object v2, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->representationIndices:[I

    invoke-static/range {p4 .. p4}, Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->access$000(Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;)[Lcom/google/android/exoplayer/chunk/Format;

    move-result-object v3

    aget-object v3, v3, v8

    iget-object v3, v3, Lcom/google/android/exoplayer/chunk/Format;->id:Ljava/lang/String;

    invoke-static {v10, v3}, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->getRepresentationIndex(Ljava/util/List;Ljava/lang/String;)I

    move-result v3

    aput v3, v2, v8

    .line 970
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 983
    .end local v8    # "j":I
    .restart local v7    # "i":I
    :cond_2
    iget-object v2, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->representationIndices:[I

    const/4 v3, 0x0

    aget v2, v2, v3

    invoke-interface {v10, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/exoplayer/dash/mpd/Representation;

    invoke-direct {p0, v4, v5, v2}, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->updateRepresentationIndependentProperties(JLcom/google/android/exoplayer/dash/mpd/Representation;)V

    .line 985
    return-void
.end method

.method static synthetic access$200(Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;)Lcom/google/android/exoplayer/drm/DrmInitData;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;

    .prologue
    .line 938
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->drmInitData:Lcom/google/android/exoplayer/drm/DrmInitData;

    return-object v0
.end method

.method static synthetic access$202(Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;Lcom/google/android/exoplayer/drm/DrmInitData;)Lcom/google/android/exoplayer/drm/DrmInitData;
    .locals 0
    .param p0, "x0"    # Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;
    .param p1, "x1"    # Lcom/google/android/exoplayer/drm/DrmInitData;

    .prologue
    .line 938
    iput-object p1, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->drmInitData:Lcom/google/android/exoplayer/drm/DrmInitData;

    return-object p1
.end method

.method private static getDrmInitData(Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;)Lcom/google/android/exoplayer/drm/DrmInitData;
    .locals 5
    .param p0, "adaptationSet"    # Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;

    .prologue
    .line 1057
    iget-object v3, p0, Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;->contentProtections:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1058
    const/4 v1, 0x0

    .line 1070
    :cond_0
    return-object v1

    .line 1060
    :cond_1
    const/4 v1, 0x0

    .line 1061
    .local v1, "drmInitData":Lcom/google/android/exoplayer/drm/DrmInitData$Mapped;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    iget-object v3, p0, Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;->contentProtections:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 1062
    iget-object v3, p0, Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;->contentProtections:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/dash/mpd/ContentProtection;

    .line 1063
    .local v0, "contentProtection":Lcom/google/android/exoplayer/dash/mpd/ContentProtection;
    iget-object v3, v0, Lcom/google/android/exoplayer/dash/mpd/ContentProtection;->uuid:Ljava/util/UUID;

    if-eqz v3, :cond_3

    iget-object v3, v0, Lcom/google/android/exoplayer/dash/mpd/ContentProtection;->data:Lcom/google/android/exoplayer/drm/DrmInitData$SchemeInitData;

    if-eqz v3, :cond_3

    .line 1064
    if-nez v1, :cond_2

    .line 1065
    new-instance v1, Lcom/google/android/exoplayer/drm/DrmInitData$Mapped;

    .end local v1    # "drmInitData":Lcom/google/android/exoplayer/drm/DrmInitData$Mapped;
    invoke-direct {v1}, Lcom/google/android/exoplayer/drm/DrmInitData$Mapped;-><init>()V

    .line 1067
    .restart local v1    # "drmInitData":Lcom/google/android/exoplayer/drm/DrmInitData$Mapped;
    :cond_2
    iget-object v3, v0, Lcom/google/android/exoplayer/dash/mpd/ContentProtection;->uuid:Ljava/util/UUID;

    iget-object v4, v0, Lcom/google/android/exoplayer/dash/mpd/ContentProtection;->data:Lcom/google/android/exoplayer/drm/DrmInitData$SchemeInitData;

    invoke-virtual {v1, v3, v4}, Lcom/google/android/exoplayer/drm/DrmInitData$Mapped;->put(Ljava/util/UUID;Lcom/google/android/exoplayer/drm/DrmInitData$SchemeInitData;)V

    .line 1061
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method private static getPeriodDurationUs(Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;I)J
    .locals 5
    .param p0, "manifest"    # Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;
    .param p1, "index"    # I

    .prologue
    const-wide/16 v2, -0x1

    .line 1075
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;->getPeriodDuration(I)J

    move-result-wide v0

    .line 1076
    .local v0, "durationMs":J
    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    .line 1079
    :goto_0
    return-wide v2

    :cond_0
    const-wide/16 v2, 0x3e8

    mul-long/2addr v2, v0

    goto :goto_0
.end method

.method private static getRepresentationIndex(Ljava/util/List;Ljava/lang/String;)I
    .locals 5
    .param p1, "formatId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer/dash/mpd/Representation;",
            ">;",
            "Ljava/lang/String;",
            ")I"
        }
    .end annotation

    .prologue
    .line 1047
    .local p0, "representations":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/dash/mpd/Representation;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 1048
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/exoplayer/dash/mpd/Representation;

    .line 1049
    .local v1, "representation":Lcom/google/android/exoplayer/dash/mpd/Representation;
    iget-object v2, v1, Lcom/google/android/exoplayer/dash/mpd/Representation;->format:Lcom/google/android/exoplayer/chunk/Format;

    iget-object v2, v2, Lcom/google/android/exoplayer/chunk/Format;->id:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1050
    return v0

    .line 1047
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1053
    .end local v1    # "representation":Lcom/google/android/exoplayer/dash/mpd/Representation;
    :cond_1
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Missing format id: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private updateRepresentationIndependentProperties(JLcom/google/android/exoplayer/dash/mpd/Representation;)V
    .locals 9
    .param p1, "periodDurationUs"    # J
    .param p3, "arbitaryRepresentation"    # Lcom/google/android/exoplayer/dash/mpd/Representation;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 1026
    invoke-virtual {p3}, Lcom/google/android/exoplayer/dash/mpd/Representation;->getIndex()Lcom/google/android/exoplayer/dash/DashSegmentIndex;

    move-result-object v2

    .line 1027
    .local v2, "segmentIndex":Lcom/google/android/exoplayer/dash/DashSegmentIndex;
    if-eqz v2, :cond_2

    .line 1028
    invoke-interface {v2}, Lcom/google/android/exoplayer/dash/DashSegmentIndex;->getFirstSegmentNum()I

    move-result v0

    .line 1029
    .local v0, "firstSegmentNum":I
    invoke-interface {v2, p1, p2}, Lcom/google/android/exoplayer/dash/DashSegmentIndex;->getLastSegmentNum(J)I

    move-result v1

    .line 1030
    .local v1, "lastSegmentNum":I
    const/4 v5, -0x1

    if-ne v1, v5, :cond_1

    :goto_0
    iput-boolean v3, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->indexIsUnbounded:Z

    .line 1031
    invoke-interface {v2}, Lcom/google/android/exoplayer/dash/DashSegmentIndex;->isExplicit()Z

    move-result v3

    iput-boolean v3, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->indexIsExplicit:Z

    .line 1032
    iget-wide v4, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->startTimeUs:J

    invoke-interface {v2, v0}, Lcom/google/android/exoplayer/dash/DashSegmentIndex;->getTimeUs(I)J

    move-result-wide v6

    add-long/2addr v4, v6

    iput-wide v4, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->availableStartTimeUs:J

    .line 1033
    iget-boolean v3, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->indexIsUnbounded:Z

    if-nez v3, :cond_0

    .line 1034
    iget-wide v4, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->startTimeUs:J

    invoke-interface {v2, v1}, Lcom/google/android/exoplayer/dash/DashSegmentIndex;->getTimeUs(I)J

    move-result-wide v6

    add-long/2addr v4, v6

    invoke-interface {v2, v1, p1, p2}, Lcom/google/android/exoplayer/dash/DashSegmentIndex;->getDurationUs(IJ)J

    move-result-wide v6

    add-long/2addr v4, v6

    iput-wide v4, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->availableEndTimeUs:J

    .line 1043
    .end local v0    # "firstSegmentNum":I
    .end local v1    # "lastSegmentNum":I
    :cond_0
    :goto_1
    return-void

    .restart local v0    # "firstSegmentNum":I
    .restart local v1    # "lastSegmentNum":I
    :cond_1
    move v3, v4

    .line 1030
    goto :goto_0

    .line 1038
    .end local v0    # "firstSegmentNum":I
    .end local v1    # "lastSegmentNum":I
    :cond_2
    iput-boolean v4, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->indexIsUnbounded:Z

    .line 1039
    iput-boolean v3, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->indexIsExplicit:Z

    .line 1040
    iget-wide v4, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->startTimeUs:J

    iput-wide v4, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->availableStartTimeUs:J

    .line 1041
    iget-wide v4, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->startTimeUs:J

    add-long/2addr v4, p1

    iput-wide v4, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->availableEndTimeUs:J

    goto :goto_1
.end method


# virtual methods
.method public getAvailableEndTimeUs()J
    .locals 2

    .prologue
    .line 1008
    invoke-virtual {p0}, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->isIndexUnbounded()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1009
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Period has unbounded index"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1011
    :cond_0
    iget-wide v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->availableEndTimeUs:J

    return-wide v0
.end method

.method public getAvailableStartTimeUs()J
    .locals 2

    .prologue
    .line 1004
    iget-wide v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->availableStartTimeUs:J

    return-wide v0
.end method

.method public isIndexExplicit()Z
    .locals 1

    .prologue
    .line 1019
    iget-boolean v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->indexIsExplicit:Z

    return v0
.end method

.method public isIndexUnbounded()Z
    .locals 1

    .prologue
    .line 1015
    iget-boolean v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->indexIsUnbounded:Z

    return v0
.end method

.method public updatePeriod(Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;ILcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;)V
    .locals 8
    .param p1, "manifest"    # Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;
    .param p2, "manifestIndex"    # I
    .param p3, "selectedTrack"    # Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/BehindLiveWindowException;
        }
    .end annotation

    .prologue
    .line 989
    invoke-virtual {p1, p2}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;->getPeriod(I)Lcom/google/android/exoplayer/dash/mpd/Period;

    move-result-object v1

    .line 990
    .local v1, "period":Lcom/google/android/exoplayer/dash/mpd/Period;
    invoke-static {p1, p2}, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->getPeriodDurationUs(Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;I)J

    move-result-wide v2

    .line 991
    .local v2, "periodDurationUs":J
    iget-object v6, v1, Lcom/google/android/exoplayer/dash/mpd/Period;->adaptationSets:Ljava/util/List;

    invoke-static {p3}, Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;->access$600(Lcom/google/android/exoplayer/dash/DashChunkSource$ExposedTrack;)I

    move-result v7

    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;

    iget-object v5, v6, Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;->representations:Ljava/util/List;

    .line 994
    .local v5, "representations":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/dash/mpd/Representation;>;"
    const/4 v0, 0x0

    .local v0, "j":I
    :goto_0
    iget-object v6, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->representationIndices:[I

    array-length v6, v6

    if-ge v0, v6, :cond_0

    .line 995
    iget-object v6, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->representationIndices:[I

    aget v6, v6, v0

    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/exoplayer/dash/mpd/Representation;

    .line 996
    .local v4, "representation":Lcom/google/android/exoplayer/dash/mpd/Representation;
    iget-object v6, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->representationHolders:Ljava/util/HashMap;

    iget-object v7, v4, Lcom/google/android/exoplayer/dash/mpd/Representation;->format:Lcom/google/android/exoplayer/chunk/Format;

    iget-object v7, v7, Lcom/google/android/exoplayer/chunk/Format;->id:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;

    invoke-virtual {v6, v2, v3, v4}, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->updateRepresentation(JLcom/google/android/exoplayer/dash/mpd/Representation;)V

    .line 994
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 999
    .end local v4    # "representation":Lcom/google/android/exoplayer/dash/mpd/Representation;
    :cond_0
    iget-object v6, p0, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->representationIndices:[I

    const/4 v7, 0x0

    aget v6, v6, v7

    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/android/exoplayer/dash/mpd/Representation;

    invoke-direct {p0, v2, v3, v6}, Lcom/google/android/exoplayer/dash/DashChunkSource$PeriodHolder;->updateRepresentationIndependentProperties(JLcom/google/android/exoplayer/dash/mpd/Representation;)V

    .line 1001
    return-void
.end method
