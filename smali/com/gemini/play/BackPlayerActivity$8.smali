.class Lcom/gemini/play/BackPlayerActivity$8;
.super Ljava/lang/Object;
.source "BackPlayerActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gemini/play/BackPlayerActivity;->exitActivity()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/gemini/play/BackPlayerActivity;


# direct methods
.method constructor <init>(Lcom/gemini/play/BackPlayerActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/gemini/play/BackPlayerActivity;

    .prologue
    .line 310
    iput-object p1, p0, Lcom/gemini/play/BackPlayerActivity$8;->this$0:Lcom/gemini/play/BackPlayerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 312
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 314
    iget-object v0, p0, Lcom/gemini/play/BackPlayerActivity$8;->this$0:Lcom/gemini/play/BackPlayerActivity;

    invoke-virtual {v0}, Lcom/gemini/play/BackPlayerActivity;->finish()V

    .line 315
    return-void
.end method
