; ModuleID = 'linked_module'
source_filename = "linked_module"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpfel"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local noundef range(i64 0, 2) i64 @entrypoint(ptr noundef readonly captures(none) %0) unnamed_addr #0 {
  %2 = alloca [32 x i8], align 1
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %2)
  %3 = getelementptr inbounds nuw i8, ptr %0, i64 16
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 1 dereferenceable(32) %2, ptr noundef nonnull align 1 dereferenceable(32) %3, i64 32, i1 false)
  br label %4

4:                                                ; preds = %4, %1
  %5 = phi i64 [ 0, %1 ], [ %9, %4 ]
  %6 = getelementptr i8, ptr %2, i64 %5
  %7 = load i8, ptr %6, align 1, !noundef !1
  %8 = icmp ne i8 %7, 3
  %9 = add nuw nsw i64 %5, 1
  %10 = icmp samesign ugt i64 %5, 30
  %11 = select i1 %8, i1 true, i1 %10
  br i1 %11, label %12, label %4

12:                                               ; preds = %4
  %13 = phi i1 [ %8, %4 ]
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %2)
  %14 = zext i1 %13 to i64
  ret i64 %14
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr captures(none)) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr captures(none)) #1

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) "no-builtins" "target-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }

!llvm.ident = !{!0, !0, !0}

!0 = !{!"rustc version 1.95.0-nightly (474276961 2026-01-26)"}
!1 = !{}
