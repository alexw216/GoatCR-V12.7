.class Lcom/gemini/play/MyVodFind3View$7;
.super Ljava/lang/Object;
.source "MyVodFind3View.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gemini/play/MyVodFind3View;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/gemini/play/MyVodFind3View;


# direct methods
.method constructor <init>(Lcom/gemini/play/MyVodFind3View;)V
    .locals 0
    .param p1, "this$0"    # Lcom/gemini/play/MyVodFind3View;

    .prologue
    .line 183
    iput-object p1, p0, Lcom/gemini/play/MyVodFind3View$7;->this$0:Lcom/gemini/play/MyVodFind3View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 1
    .param p2, "arg1"    # Landroid/view/View;
    .param p3, "arg2"    # I
    .param p4, "arg3"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 186
    .local p1, "arg0":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v0, p0, Lcom/gemini/play/MyVodFind3View$7;->this$0:Lcom/gemini/play/MyVodFind3View;

    invoke-static {v0}, Lcom/gemini/play/MyVodFind3View;->access$500(Lcom/gemini/play/MyVodFind3View;)Lcom/gemini/play/MySimpleAdapterInputView;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 188
    iget-object v0, p0, Lcom/gemini/play/MyVodFind3View$7;->this$0:Lcom/gemini/play/MyVodFind3View;

    invoke-static {v0}, Lcom/gemini/play/MyVodFind3View;->access$500(Lcom/gemini/play/MyVodFind3View;)Lcom/gemini/play/MySimpleAdapterInputView;

    move-result-object v0

    invoke-virtual {v0, p3}, Lcom/gemini/play/MySimpleAdapterInputView;->setSeclection(I)V

    .line 189
    iget-object v0, p0, Lcom/gemini/play/MyVodFind3View$7;->this$0:Lcom/gemini/play/MyVodFind3View;

    invoke-static {v0}, Lcom/gemini/play/MyVodFind3View;->access$500(Lcom/gemini/play/MyVodFind3View;)Lcom/gemini/play/MySimpleAdapterInputView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/gemini/play/MySimpleAdapterInputView;->notifyDataSetChanged()V

    .line 191
    :cond_0
    return-void
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 196
    .local p1, "arg0":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    return-void
.end method