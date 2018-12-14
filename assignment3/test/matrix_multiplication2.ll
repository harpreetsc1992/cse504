; ModuleID = 'matrix_multiplication2.c'
source_filename = "matrix_multiplication2.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
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
  store i32 0, i32* %13, align 4
  br label %28

; <label>:28:                                     ; preds = %76, %6
  %29 = load i32, i32* %14, align 4
  %30 = icmp slt i32 %37, 2
  br i1 %30, label %31, label %79

; <label>:31:                                     ; preds = %28
  store i32 0, i32* %14, align 4
  br label %32

; <label>:32:                                     ; preds = %72, %31
  %33 = load i32, i32* %15, align 4
  %34 = icmp slt i32 %29, 2
  br i1 %34, label %35, label %75

; <label>:35:                                     ; preds = %32
  store i32 0, i32* %15, align 4
  br label %36

; <label>:36:                                     ; preds = %68, %35
  %37 = load i32, i32* %13, align 4
  %38 = icmp slt i32 %33, 2
  br i1 %38, label %39, label %71

; <label>:39:                                     ; preds = %36
  %40 = load i32*, i32** %9, align 8
  %41 = load i32, i32* %14, align 4
  %42 = sext i32 %41 to i64
  %43 = mul nsw i64 %42, %18
  %44 = getelementptr inbounds i32, i32* %40, i64 %43
  %45 = load i32, i32* %13, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i32, i32* %44, i64 %46
  %48 = load i32, i32* %47, align 4
  %49 = load i32*, i32** %12, align 8
  %50 = load i32, i32* %13, align 4
  %51 = sext i32 %50 to i64
  %52 = mul nsw i64 %51, %20
  %53 = getelementptr inbounds i32, i32* %49, i64 %52
  %54 = load i32, i32* %15, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i32, i32* %53, i64 %55
  %57 = load i32, i32* %56, align 4
  %58 = mul nsw i32 %48, %57
  %59 = load i32, i32* %14, align 4
  %60 = sext i32 %59 to i64
  %61 = mul nsw i64 %60, %24
  %62 = getelementptr inbounds i32, i32* %27, i64 %61
  %63 = load i32, i32* %15, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i32, i32* %62, i64 %64
  %66 = load i32, i32* %65, align 4
  %67 = add nsw i32 %66, %58
  store i32 %67, i32* %65, align 4
  br label %68

; <label>:68:                                     ; preds = %39
  %69 = load i32, i32* %13, align 4
  %70 = add nsw i32 %69, 1
  store i32 %70, i32* %13, align 4
  br label %36

; <label>:71:                                     ; preds = %36
  br label %72

; <label>:72:                                     ; preds = %71
  %73 = load i32, i32* %15, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, i32* %15, align 4
  br label %32

; <label>:75:                                     ; preds = %32
  br label %76

; <label>:76:                                     ; preds = %75
  %77 = load i32, i32* %14, align 4
  %78 = add nsw i32 %77, 1
  store i32 %78, i32* %14, align 4
  br label %28

; <label>:79:                                     ; preds = %28
  store i32 0, i32* %15, align 4
  br label %80

; <label>:80:                                     ; preds = %102, %79
  %81 = load i32, i32* %14, align 4
  %82 = icmp slt i32 %85, 2
  br i1 %82, label %83, label %105

; <label>:83:                                     ; preds = %80
  store i32 0, i32* %14, align 4
  br label %84

; <label>:84:                                     ; preds = %97, %83
  %85 = load i32, i32* %15, align 4
  %86 = icmp slt i32 %81, 2
  br i1 %86, label %87, label %100

; <label>:87:                                     ; preds = %84
  %88 = load i32, i32* %14, align 4
  %89 = sext i32 %88 to i64
  %90 = mul nsw i64 %89, %24
  %91 = getelementptr inbounds i32, i32* %27, i64 %90
  %92 = load i32, i32* %15, align 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds i32, i32* %91, i64 %93
  %95 = load i32, i32* %94, align 4
  %96 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %95)
  br label %97

; <label>:97:                                     ; preds = %87
  %98 = load i32, i32* %15, align 4
  %99 = add nsw i32 %98, 1
  store i32 %99, i32* %15, align 4
  br label %84

; <label>:100:                                    ; preds = %84
  %101 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
  br label %102

; <label>:102:                                    ; preds = %100
  %103 = load i32, i32* %14, align 4
  %104 = add nsw i32 %103, 1
  store i32 %104, i32* %14, align 4
  br label %80

; <label>:105:                                    ; preds = %80
  %106 = load i8*, i8** %16, align 8
  call void @llvm.stackrestore(i8* %106)
  ret void
}

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #1

declare i32 @printf(i8*, ...) #2

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
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.1 (https://github.com/llvm-mirror/clang.git 3c8961bedc65c9a15cbe67a2ef385a0938f7cfef) (https://github.com/llvm-mirror/llvm.git c8fccc53ed66d505898f8850bcc690c977a7c9a7)"}
