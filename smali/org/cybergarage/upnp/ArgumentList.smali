.class public Lorg/cybergarage/upnp/ArgumentList;
.super Ljava/util/Vector;


# static fields
.field public static final ELEM_NAME:Ljava/lang/String; = "argumentList"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/util/Vector;-><init>()V

    return-void
.end method


# virtual methods
.method public getArgument(I)Lorg/cybergarage/upnp/b;
    .locals 1

    invoke-virtual {p0, p1}, Lorg/cybergarage/upnp/ArgumentList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cybergarage/upnp/b;

    return-object v0
.end method

.method public getArgument(Ljava/lang/String;)Lorg/cybergarage/upnp/b;
    .locals 5

    invoke-virtual {p0}, Lorg/cybergarage/upnp/ArgumentList;->size()I

    move-result v2

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    if-ge v1, v2, :cond_2

    invoke-virtual {p0, v1}, Lorg/cybergarage/upnp/ArgumentList;->getArgument(I)Lorg/cybergarage/upnp/b;

    move-result-object v0

    invoke-virtual {v0}, Lorg/cybergarage/upnp/b;->b()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_1

    :cond_0
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_1
    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    :goto_1
    return-object v0

    :cond_2
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public set(Lorg/cybergarage/upnp/ArgumentList;)V
    .locals 4

    invoke-virtual {p1}, Lorg/cybergarage/upnp/ArgumentList;->size()I

    move-result v1

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v1, :cond_1

    invoke-virtual {p1, v0}, Lorg/cybergarage/upnp/ArgumentList;->getArgument(I)Lorg/cybergarage/upnp/b;

    move-result-object v2

    invoke-virtual {v2}, Lorg/cybergarage/upnp/b;->b()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/cybergarage/upnp/ArgumentList;->getArgument(Ljava/lang/String;)Lorg/cybergarage/upnp/b;

    move-result-object v3

    if-nez v3, :cond_0

    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {v2}, Lorg/cybergarage/upnp/b;->f()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Lorg/cybergarage/upnp/b;->b(Ljava/lang/String;)V

    goto :goto_1

    :cond_1
    return-void
.end method

.method public setReqArgs(Lorg/cybergarage/upnp/ArgumentList;)V
    .locals 5

    invoke-virtual {p0}, Lorg/cybergarage/upnp/ArgumentList;->size()I

    move-result v1

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v1, :cond_2

    invoke-virtual {p0, v0}, Lorg/cybergarage/upnp/ArgumentList;->getArgument(I)Lorg/cybergarage/upnp/b;

    move-result-object v2

    invoke-virtual {v2}, Lorg/cybergarage/upnp/b;->d()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {v2}, Lorg/cybergarage/upnp/b;->b()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Lorg/cybergarage/upnp/ArgumentList;->getArgument(Ljava/lang/String;)Lorg/cybergarage/upnp/b;

    move-result-object v4

    if-nez v4, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Argument \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\" missing."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    invoke-virtual {v4}, Lorg/cybergarage/upnp/b;->f()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/cybergarage/upnp/b;->b(Ljava/lang/String;)V

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method public setResArgs(Lorg/cybergarage/upnp/ArgumentList;)V
    .locals 5

    invoke-virtual {p0}, Lorg/cybergarage/upnp/ArgumentList;->size()I

    move-result v1

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v1, :cond_2

    invoke-virtual {p0, v0}, Lorg/cybergarage/upnp/ArgumentList;->getArgument(I)Lorg/cybergarage/upnp/b;

    move-result-object v2

    invoke-virtual {v2}, Lorg/cybergarage/upnp/b;->e()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {v2}, Lorg/cybergarage/upnp/b;->b()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Lorg/cybergarage/upnp/ArgumentList;->getArgument(Ljava/lang/String;)Lorg/cybergarage/upnp/b;

    move-result-object v4

    if-nez v4, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Argument \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\" missing."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    invoke-virtual {v4}, Lorg/cybergarage/upnp/b;->f()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/cybergarage/upnp/b;->b(Ljava/lang/String;)V

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method
