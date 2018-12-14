; ModuleID = 'matrix_multiplication1.c'
source_filename = "matrix_multiplication1.c"
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
  %17 = alloca i32, align 4
  store i32 %0, i32* %7, align 4
  store i32 %1, i32* %8, align 4
  store i32* %2, i32** %9, align 8
  store i32 %3, i32* %10, align 4
  store i32 %4, i32* %11, align 4
  store i32* %5, i32** %12, align 8
  %18 = load i32, i32* %8, align 4
  %19 = zext i32 %18 to i64
  %20 = load i32, i32* %11, align 4
  %21 = zext i32 %20 to i64
  %22 = load i32, i32* %7, align 4
  %23 = zext i32 %22 to i64
  %24 = load i32, i32* %11, align 4
  %25 = zext i32 %24 to i64
  %26 = call i8* @llvm.stacksave()
  store i8* %26, i8** %16, align 8
  %27 = mul nuw i64 %23, %25
  %28 = alloca i32, i64 %27, align 16
  store i32 10, i32* %17, align 4
  store i32 0, i32* %15, align 4
  br label %29

; <label>:29:                                     ; preds = %89, %6
  %30 = load i32, i32* %14, align 4
  %31 = icmp slt i32 %34, 2
  br i1 %31, label %32, label %92

; <label>:32:                                     ; preds = %29
  store i32 0, i32* %14, align 4
  br label %33

; <label>:33:                                     ; preds = %85, %32
  %34 = load i32, i32* %15, align 4
  %35 = icmp slt i32 %30, 2
  br i1 %35, label %36, label %88

; <label>:36:                                     ; preds = %33
  %37 = load i32, i32* %15, align 4
  store i32 %37, i32* %17, align 4
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %39, label %40

; <label>:39:                                     ; preds = %36
  br label %40

; <label>:40:                                     ; preds = %39, %36
  %41 = load i32, i32* %14, align 4
  %42 = sext i32 %41 to i64
  %43 = mul nsw i64 %42, %25
  %44 = getelementptr inbounds i32, i32* %28, i64 %43
  %45 = load i32, i32* %15, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i32, i32* %44, i64 %46
  store i32 0, i32* %47, align 4
  store i32 0, i32* %13, align 4
  br label %48

; <label>:48:                                     ; preds = %81, %40
  %49 = load i32, i32* %13, align 4
  %50 = load i32, i32* %8, align 4
  %51 = icmp slt i32 %49, %50
  br i1 %51, label %52, label %84

; <label>:52:                                     ; preds = %48
  %53 = load i32*, i32** %9, align 8
  %54 = load i32, i32* %14, align 4
  %55 = sext i32 %54 to i64
  %56 = mul nsw i64 %55, %19
  %57 = getelementptr inbounds i32, i32* %53, i64 %56
  %58 = load i32, i32* %13, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i32, i32* %57, i64 %59
  %61 = load i32, i32* %60, align 4
  %62 = load i32*, i32** %12, align 8
  %63 = load i32, i32* %13, align 4
  %64 = sext i32 %63 to i64
  %65 = mul nsw i64 %64, %21
  %66 = getelementptr inbounds i32, i32* %62, i64 %65
  %67 = load i32, i32* %15, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32* %66, i64 %68
  %70 = load i32, i32* %69, align 4
  %71 = mul nsw i32 %61, %70
  %72 = load i32, i32* %14, align 4
  %73 = sext i32 %72 to i64
  %74 = mul nsw i64 %73, %25
  %75 = getelementptr inbounds i32, i32* %28, i64 %74
  %76 = load i32, i32* %15, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i32, i32* %75, i64 %77
  %79 = load i32, i32* %78, align 4
  %80 = add nsw i32 %79, %71
  store i32 %80, i32* %78, align 4
  br label %81

; <label>:81:                                     ; preds = %52
  %82 = load i32, i32* %13, align 4
  %83 = add nsw i32 %82, 1
  store i32 %83, i32* %13, align 4
  br label %48

; <label>:84:                                     ; preds = %48
  br label %85

; <label>:85:                                     ; preds = %84
  %86 = load i32, i32* %15, align 4
  %87 = add nsw i32 %86, 1
  store i32 %87, i32* %15, align 4
  br label %33

; <label>:88:                                     ; preds = %33
  br label %89

; <label>:89:                                     ; preds = %88
  %90 = load i32, i32* %14, align 4
  %91 = add nsw i32 %90, 1
  store i32 %91, i32* %14, align 4
  br label %29

; <label>:92:                                     ; preds = %29
  store i32 0, i32* %15, align 4
  br label %93

; <label>:93:                                     ; preds = %115, %92
  %94 = load i32, i32* %14, align 4
  %95 = icmp slt i32 %98, 2
  br i1 %95, label %96, label %118

; <label>:96:                                     ; preds = %93
  store i32 0, i32* %14, align 4
  br label %97

; <label>:97:                                     ; preds = %110, %96
  %98 = load i32, i32* %15, align 4
  %99 = icmp slt i32 %94, 2
  br i1 %99, label %100, label %113

; <label>:100:                                    ; preds = %97
  %101 = load i32, i32* %14, align 4
  %102 = sext i32 %101 to i64
  %103 = mul nsw i64 %102, %25
  %104 = getelementptr inbounds i32, i32* %28, i64 %103
  %105 = load i32, i32* %15, align 4
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds i32, i32* %104, i64 %106
  %108 = load i32, i32* %107, align 4
  %109 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %108)
  br label %110

; <label>:110:                                    ; preds = %100
  %111 = load i32, i32* %15, align 4
  %112 = add nsw i32 %111, 1
  store i32 %112, i32* %15, align 4
  br label %97

; <label>:113:                                    ; preds = %97
  %114 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
  br label %115

; <label>:115:                                    ; preds = %113
  %116 = load i32, i32* %14, align 4
  %117 = add nsw i32 %116, 1
  store i32 %117, i32* %14, align 4
  br label %93

; <label>:118:                                    ; preds = %93
  %119 = load i8*, i8** %16, align 8
  call void @llvm.stackrestore(i8* %119)
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
