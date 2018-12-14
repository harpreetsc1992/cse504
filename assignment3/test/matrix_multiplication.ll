; ModuleID = 'matrix_multiplication.c'
source_filename = "matrix_multiplication.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@main.mat1 = private unnamed_addr constant [2 x [3 x i32]] [[3 x i32] [i32 2, i32 4, i32 4], [3 x i32] [i32 3, i32 4, i32 4]], align 16
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
  store i32 0, i32* %15, align 4
  br label %28

; <label>:28:                                     ; preds = %84, %6
  %29 = load i32, i32* %14, align 4
  %30 = icmp slt i32 %33, 3
  br i1 %30, label %31, label %87

; <label>:31:                                     ; preds = %28
  store i32 0, i32* %14, align 4
  br label %32

; <label>:32:                                     ; preds = %80, %31
  %33 = load i32, i32* %15, align 4
  %34 = icmp slt i32 %29, 2
  br i1 %34, label %35, label %83

; <label>:35:                                     ; preds = %32
  %36 = load i32, i32* %14, align 4
  %37 = sext i32 %36 to i64
  %38 = mul nsw i64 %37, %24
  %39 = getelementptr inbounds i32, i32* %27, i64 %38
  %40 = load i32, i32* %15, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i32, i32* %39, i64 %41
  store i32 0, i32* %42, align 4
  store i32 0, i32* %13, align 4
  br label %43

; <label>:43:                                     ; preds = %76, %35
  %44 = load i32, i32* %13, align 4
  %45 = load i32, i32* %8, align 4
  %46 = icmp slt i32 %44, %45
  br i1 %46, label %47, label %79

; <label>:47:                                     ; preds = %43
  %48 = load i32*, i32** %9, align 8
  %49 = load i32, i32* %14, align 4
  %50 = sext i32 %49 to i64
  %51 = mul nsw i64 %50, %18
  %52 = getelementptr inbounds i32, i32* %48, i64 %51
  %53 = load i32, i32* %13, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i32, i32* %52, i64 %54
  %56 = load i32, i32* %55, align 4
  %57 = load i32*, i32** %12, align 8
  %58 = load i32, i32* %13, align 4
  %59 = sext i32 %58 to i64
  %60 = mul nsw i64 %59, %20
  %61 = getelementptr inbounds i32, i32* %57, i64 %60
  %62 = load i32, i32* %15, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i32, i32* %61, i64 %63
  %65 = load i32, i32* %64, align 4
  %66 = mul nsw i32 %56, %65
  %67 = load i32, i32* %14, align 4
  %68 = sext i32 %67 to i64
  %69 = mul nsw i64 %68, %24
  %70 = getelementptr inbounds i32, i32* %27, i64 %69
  %71 = load i32, i32* %15, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i32, i32* %70, i64 %72
  %74 = load i32, i32* %73, align 4
  %75 = add nsw i32 %74, %66
  store i32 %75, i32* %73, align 4
  br label %76

; <label>:76:                                     ; preds = %47
  %77 = load i32, i32* %13, align 4
  %78 = add nsw i32 %77, 1
  store i32 %78, i32* %13, align 4
  br label %43

; <label>:79:                                     ; preds = %43
  br label %80

; <label>:80:                                     ; preds = %79
  %81 = load i32, i32* %15, align 4
  %82 = add nsw i32 %81, 1
  store i32 %82, i32* %15, align 4
  br label %32

; <label>:83:                                     ; preds = %32
  br label %84

; <label>:84:                                     ; preds = %83
  %85 = load i32, i32* %14, align 4
  %86 = add nsw i32 %85, 1
  store i32 %86, i32* %14, align 4
  br label %28

; <label>:87:                                     ; preds = %28
  store i32 0, i32* %15, align 4
  br label %88

; <label>:88:                                     ; preds = %110, %87
  %89 = load i32, i32* %14, align 4
  %90 = icmp slt i32 %93, 2
  br i1 %90, label %91, label %113

; <label>:91:                                     ; preds = %88
  store i32 0, i32* %14, align 4
  br label %92

; <label>:92:                                     ; preds = %105, %91
  %93 = load i32, i32* %15, align 4
  %94 = icmp slt i32 %89, 2
  br i1 %94, label %95, label %108

; <label>:95:                                     ; preds = %92
  %96 = load i32, i32* %14, align 4
  %97 = sext i32 %96 to i64
  %98 = mul nsw i64 %97, %24
  %99 = getelementptr inbounds i32, i32* %27, i64 %98
  %100 = load i32, i32* %15, align 4
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds i32, i32* %99, i64 %101
  %103 = load i32, i32* %102, align 4
  %104 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %103)
  br label %105

; <label>:105:                                    ; preds = %95
  %106 = load i32, i32* %15, align 4
  %107 = add nsw i32 %106, 1
  store i32 %107, i32* %15, align 4
  br label %92

; <label>:108:                                    ; preds = %92
  %109 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
  br label %110

; <label>:110:                                    ; preds = %108
  %111 = load i32, i32* %14, align 4
  %112 = add nsw i32 %111, 1
  store i32 %112, i32* %14, align 4
  br label %88

; <label>:113:                                    ; preds = %88
  %114 = load i8*, i8** %16, align 8
  call void @llvm.stackrestore(i8* %114)
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
  %2 = alloca [2 x [3 x i32]], align 16
  %3 = alloca [2 x [2 x i32]], align 16
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  %8 = bitcast [2 x [3 x i32]]* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* bitcast ([2 x [3 x i32]]* @main.mat1 to i8*), i64 24, i32 16, i1 false)
  %9 = bitcast [2 x [2 x i32]]* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* bitcast ([2 x [2 x i32]]* @main.mat2 to i8*), i64 16, i32 16, i1 false)
  store i32 2, i32* %4, align 4
  store i32 2, i32* %5, align 4
  store i32 3, i32* %6, align 4
  store i32 2, i32* %7, align 4
  %10 = load i32, i32* %4, align 4
  %11 = load i32, i32* %5, align 4
  %12 = getelementptr inbounds [2 x [3 x i32]], [2 x [3 x i32]]* %2, i32 0, i32 0
  %13 = bitcast [3 x i32]* %12 to i32*
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
