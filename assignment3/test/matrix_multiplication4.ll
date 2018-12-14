; ModuleID = 'matrix_multiplication4.c'
source_filename = "matrix_multiplication4.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.mat1 = private unnamed_addr constant [2 x [2 x i32]] [[2 x i32] [i32 2, i32 4], [2 x i32] [i32 3, i32 4]], align 16
@main.mat2 = private unnamed_addr constant [2 x [2 x i32]] [[2 x i32] [i32 1, i32 2], [2 x i32] [i32 1, i32 3]], align 16

; Function Attrs: noinline nounwind uwtable
define void @multiply(i32, i32, i32*, i32, i32, i32*) #0 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i8*, align 8
  store i32 %0, i32* %7, align 4
  store i32 %1, i32* %8, align 4
  store i32* %2, i32** %9, align 8
  store i32 %3, i32* %10, align 4
  store i32 %4, i32* %11, align 4
  store i32* %5, i32** %12, align 8
  %17 = load i32, i32* %8, align 4
  %18 = zext i32 %17 to i64
  %19 = load i32, i32* %11, align 4
  %20 = zext i32 %19 to i64
  %21 = load i32, i32* %7, align 4
  %22 = zext i32 %21 to i64
  %23 = load i32, i32* %11, align 4
  %24 = zext i32 %23 to i64
  %25 = call i8* @llvm.stacksave()
  store i8* %25, i8** %16, align 8
  %26 = mul nuw i64 %22, %24
  %27 = alloca i32, i64 %26, align 16
  store i32 0, i32* %14, align 4
  br label %28

; <label>:28:                                     ; preds = %50, %6
  %29 = load i32, i32* %14, align 4
  %30 = icmp slt i32 %29, 2
  br i1 %30, label %31, label %53

; <label>:31:                                     ; preds = %28
  store i32 0, i32* %15, align 4
  br label %32

; <label>:32:                                     ; preds = %46, %31
  %33 = load i32, i32* %15, align 4
  %34 = icmp slt i32 %33, 3
  br i1 %34, label %35, label %49

; <label>:35:                                     ; preds = %32
  store i32 0, i32* %13, align 4
  br label %36

; <label>:36:                                     ; preds = %42, %35
  %37 = load i32, i32* %13, align 4
  %38 = icmp slt i32 %37, 4
  br i1 %38, label %39, label %45

; <label>:39:                                     ; preds = %36
  %40 = load i32, i32* %13, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, i32* %13, align 4
  br label %42

; <label>:42:                                     ; preds = %39
  %43 = load i32, i32* %13, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, i32* %13, align 4
  br label %36

; <label>:45:                                     ; preds = %36
  br label %46

; <label>:46:                                     ; preds = %45
  %47 = load i32, i32* %15, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, i32* %15, align 4
  br label %32

; <label>:49:                                     ; preds = %32
  br label %50

; <label>:50:                                     ; preds = %49
  %51 = load i32, i32* %14, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, i32* %14, align 4
  br label %28

; <label>:53:                                     ; preds = %28
  store i32 0, i32* %15, align 4
  br label %54

; <label>:54:                                     ; preds = %66, %53
  %55 = load i32, i32* %14, align 4
  %56 = icmp slt i32 %59, 4
  br i1 %56, label %57, label %69

; <label>:57:                                     ; preds = %54
  store i32 0, i32* %14, align 4
  br label %58

; <label>:58:                                     ; preds = %62, %57
  %59 = load i32, i32* %15, align 4
  %60 = icmp slt i32 %55, 2
  br i1 %60, label %61, label %65

; <label>:61:                                     ; preds = %58
  br label %62

; <label>:62:                                     ; preds = %61
  %63 = load i32, i32* %15, align 4
  %64 = add nsw i32 %63, 1
  store i32 %64, i32* %15, align 4
  br label %58

; <label>:65:                                     ; preds = %58
  br label %66

; <label>:66:                                     ; preds = %65
  %67 = load i32, i32* %14, align 4
  %68 = add nsw i32 %67, 1
  store i32 %68, i32* %14, align 4
  br label %54

; <label>:69:                                     ; preds = %54
  %70 = load i8*, i8** %16, align 8
  call void @llvm.stackrestore(i8* %70)
  ret void
}

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #1

; Function Attrs: nounwind
declare void @llvm.stackrestore(i8*) #1

; Function Attrs: noinline nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [2 x [2 x i32]], align 16
  %3 = alloca [2 x [2 x i32]], align 16
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  %8 = bitcast [2 x [2 x i32]]* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* bitcast ([2 x [2 x i32]]* @main.mat1 to i8*), i64 16, i32 16, i1 false)
  %9 = bitcast [2 x [2 x i32]]* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* bitcast ([2 x [2 x i32]]* @main.mat2 to i8*), i64 16, i32 16, i1 false)
  store i32 2, i32* %4, align 4
  store i32 2, i32* %5, align 4
  store i32 2, i32* %6, align 4
  store i32 2, i32* %7, align 4
  %10 = load i32, i32* %4, align 4
  %11 = load i32, i32* %5, align 4
  %12 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %2, i32 0, i32 0
  %13 = bitcast [2 x i32]* %12 to i32*
  %14 = load i32, i32* %6, align 4
  %15 = load i32, i32* %7, align 4
  %16 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %3, i32 0, i32 0
  %17 = bitcast [2 x i32]* %16 to i32*
  call void @multiply(i32 %10, i32 %11, i32* %13, i32 %14, i32 %15, i32* %17)
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { argmemonly nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.1 (https://github.com/llvm-mirror/clang.git 3c8961bedc65c9a15cbe67a2ef385a0938f7cfef) (https://github.com/llvm-mirror/llvm.git c8fccc53ed66d505898f8850bcc690c977a7c9a7)"}
