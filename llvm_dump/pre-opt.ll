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

4:                                                ; preds = %12, %3
  %5 = phi i64 [ 0, %3 ], [ %6, %12 ]
  %6 = add i64 %5, 8
  %7 = icmp ne i64 %5, -8
  tail call void @llvm.assume(i1 %7)
  %8 = icmp ugt i64 %6, %2
  br i1 %8, label %9, label %12

9:                                                ; preds = %4
  %10 = phi i64 [ %5, %4 ]
  %11 = icmp ult i64 %10, %2
  br i1 %11, label %21, label %28

12:                                               ; preds = %4
  %13 = getelementptr inbounds nuw i8, ptr %0, i64 %5
  %14 = load i64, ptr %13, align 1
  %15 = getelementptr inbounds nuw i8, ptr %1, i64 %5
  %16 = load i64, ptr %15, align 1
  %17 = icmp eq i64 %14, %16
  br i1 %17, label %4, label %28

18:                                               ; preds = %21
  %19 = add nuw i64 %22, 1
  %20 = icmp ult i64 %19, %2
  br i1 %20, label %21, label %28

21:                                               ; preds = %18, %9
  %22 = phi i64 [ %19, %18 ], [ %10, %9 ]
  %23 = getelementptr inbounds nuw i8, ptr %0, i64 %22
  %24 = load i8, ptr %23, align 1, !noundef !1
  %25 = getelementptr inbounds nuw i8, ptr %1, i64 %22
  %26 = load i8, ptr %25, align 1, !noundef !1
  %27 = icmp eq i8 %24, %26
  br i1 %27, label %18, label %28

28:                                               ; preds = %21, %18, %12, %9
  %29 = phi i32 [ 0, %9 ], [ 0, %18 ], [ 1, %21 ], [ 1, %12 ]
  ret i32 %29
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read) "target-cpu"="v2" }
attributes #1 = { nofree norecurse nosync nounwind memory(argmem: read) "target-cpu"="v2" }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }

!llvm.ident = !{!0, !0, !0}

!0 = !{!"rustc version 1.95.0-nightly (474276961 2026-01-26)"}
!1 = !{}
