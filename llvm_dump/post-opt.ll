; ModuleID = 'linked_module'
source_filename = "linked_module"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpfel"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read)
define dso_local noundef range(i64 0, 2) i64 @entrypoint(ptr noundef readonly captures(none) %0) unnamed_addr #0 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i64 16
  %3 = load i64, ptr %2, align 1
  %4 = icmp eq i64 %3, 217020518514230019
  br i1 %4, label %5, label %18

5:                                                ; preds = %1
  %6 = getelementptr inbounds nuw i8, ptr %0, i64 40
  %7 = load i64, ptr %6, align 1
  %8 = getelementptr inbounds nuw i8, ptr %0, i64 32
  %9 = load i64, ptr %8, align 1
  %10 = getelementptr inbounds nuw i8, ptr %0, i64 24
  %11 = load i64, ptr %10, align 1
  %12 = icmp eq i64 %11, 217020518514230019
  %13 = icmp eq i64 %9, 217020518514230019
  %14 = select i1 %12, i1 %13, i1 false
  %15 = icmp eq i64 %7, 217020518514230019
  %16 = select i1 %14, i1 %15, i1 false
  br i1 %16, label %17, label %18

17:                                               ; preds = %5
  br label %18

18:                                               ; preds = %17, %5, %1
  %19 = phi i64 [ 0, %17 ], [ 1, %5 ], [ 1, %1 ]
  ret i64 %19
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: read)
define hidden noundef range(i32 0, 2) i32 @memcmp(ptr noundef readonly captures(none) %0, ptr noundef readonly captures(none) %1, i64 noundef %2) local_unnamed_addr #1 {
  br label %4

4:                                                ; preds = %11, %3
  %5 = phi i64 [ 0, %3 ], [ %6, %11 ]
  %6 = add i64 %5, 8
  %7 = icmp ne i64 %5, -8
  tail call void @llvm.assume(i1 %7)
  %8 = icmp ugt i64 %6, %2
  br i1 %8, label %9, label %11

9:                                                ; preds = %4
  %10 = icmp ult i64 %5, %2
  br i1 %10, label %.preheader, label %.loopexit

11:                                               ; preds = %4
  %12 = getelementptr inbounds nuw i8, ptr %0, i64 %5
  %13 = load i64, ptr %12, align 1
  %14 = getelementptr inbounds nuw i8, ptr %1, i64 %5
  %15 = load i64, ptr %14, align 1
  %16 = icmp eq i64 %13, %15
  br i1 %16, label %4, label %.loopexit

17:                                               ; preds = %.preheader
  %18 = add nuw i64 %20, 1
  %19 = icmp ult i64 %18, %2
  br i1 %19, label %.preheader, label %.loopexit

.preheader:                                       ; preds = %9, %17
  %20 = phi i64 [ %18, %17 ], [ %5, %9 ]
  %21 = getelementptr inbounds nuw i8, ptr %0, i64 %20
  %22 = load i8, ptr %21, align 1, !noundef !1
  %23 = getelementptr inbounds nuw i8, ptr %1, i64 %20
  %24 = load i8, ptr %23, align 1, !noundef !1
  %25 = icmp eq i8 %22, %24
  br i1 %25, label %17, label %.loopexit

.loopexit:                                        ; preds = %11, %.preheader, %17, %9
  %26 = phi i32 [ 0, %9 ], [ 1, %.preheader ], [ 0, %17 ], [ 1, %11 ]
  ret i32 %26
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read) "target-cpu"="v2" }
attributes #1 = { nofree norecurse nosync nounwind memory(argmem: read) "target-cpu"="v2" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }

!llvm.ident = !{!0, !0, !0}

!0 = !{!"rustc version 1.95.0-nightly (474276961 2026-01-26)"}
!1 = !{}
