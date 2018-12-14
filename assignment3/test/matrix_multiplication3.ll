; ModuleID = 'matrix_multiplication3.c'
source_filename = "matrix_multiplication3.c"
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
  store i32 0, i32* %14, align 4
  br label %28

; <label>:28:                                     ; preds = %88, %6
  %29 = load i32, i32* %14, align 4
  %30 = icmp slt i32 %29, 2
  br i1 %30, label %31, label %91

; <label>:31:                                     ; preds = %28
  %32 = load i32, i32* %8, align 4
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %35

; <label>:34:                                     ; preds = %31
  call void @exit(i32 1) #5
  unreachable

; <label>:35:                                     ; preds = %31
  store i32 0, i32* %15, align 4
  br label %36

; <label>:36:                                     ; preds = %84, %35
  %37 = load i32, i32* %15, align 4
  %38 = icmp slt i32 %37, 2
  br i1 %38, label %39, label %87

; <label>:39:                                     ; preds = %36
  %40 = load i32, i32* %14, align 4
  %41 = sext i32 %40 to i64
  %42 = mul nsw i64 %41, %24
  %43 = getelementptr inbounds i32, i32* %27, i64 %42
  %44 = load i32, i32* %15, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i32, i32* %43, i64 %45
  store i32 0, i32* %46, align 4
  store i32 0, i32* %13, align 4
  br label %47

; <label>:47:                                     ; preds = %80, %39
  %48 = load i32, i32* %13, align 4
  %49 = load i32, i32* %8, align 4
  %50 = icmp slt i32 %48, %49
  br i1 %50, label %51, label %83

; <label>:51:                                     ; preds = %47
  %52 = load i32*, i32** %9, align 8
  %53 = load i32, i32* %14, align 4
  %54 = sext i32 %53 to i64
  %55 = mul nsw i64 %54, %18
  %56 = getelementptr inbounds i32, i32* %52, i64 %55
  %57 = load i32, i32* %13, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i32, i32* %56, i64 %58
  %60 = load i32, i32* %59, align 4
  %61 = load i32*, i32** %12, align 8
  %62 = load i32, i32* %13, align 4
  %63 = sext i32 %62 to i64
  %64 = mul nsw i64 %63, %20
  %65 = getelementptr inbounds i32, i32* %61, i64 %64
  %66 = load i32, i32* %15, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i32, i32* %65, i64 %67
  %69 = load i32, i32* %68, align 4
  %70 = mul nsw i32 %60, %69
  %71 = load i32, i32* %14, align 4
  %72 = sext i32 %71 to i64
  %73 = mul nsw i64 %72, %24
  %74 = getelementptr inbounds i32, i32* %27, i64 %73
  %75 = load i32, i32* %15, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds i32, i32* %74, i64 %76
  %78 = load i32, i32* %77, align 4
  %79 = add nsw i32 %78, %70
  store i32 %79, i32* %77, align 4
  br label %80

; <label>:80:                                     ; preds = %51
  %81 = load i32, i32* %13, align 4
  %82 = add nsw i32 %81, 1
  store i32 %82, i32* %13, align 4
  br label %47

; <label>:83:                                     ; preds = %47
  br label %84

; <label>:84:                                     ; preds = %83
  %85 = load i32, i32* %15, align 4
  %86 = add nsw i32 %85, 1
  store i32 %86, i32* %15, align 4
  br label %36

; <label>:87:                                     ; preds = %36
  br label %88

; <label>:88:                                     ; preds = %87
  %89 = load i32, i32* %14, align 4
  %90 = add nsw i32 %89, 1
  store i32 %90, i32* %14, align 4
  br label %28

; <label>:91:                                     ; preds = %28
  store i32 0, i32* %15, align 4
  br label %92

; <label>:92:                                     ; preds = %114, %91
  %93 = load i32, i32* %14, align 4
  %94 = icmp slt i32 %97, 2
  br i1 %94, label %95, label %117

; <label>:95:                                     ; preds = %92
  store i32 0, i32* %14, align 4
  br label %96

; <label>:96:                                     ; preds = %109, %95
  %97 = load i32, i32* %15, align 4
  %98 = icmp slt i32 %93, 2
  br i1 %98, label %99, label %112

; <label>:99:                                     ; preds = %96
  %100 = load i32, i32* %14, align 4
  %101 = sext i32 %100 to i64
  %102 = mul nsw i64 %101, %24
  %103 = getelementptr inbounds i32, i32* %27, i64 %102
  %104 = load i32, i32* %15, align 4
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds i32, i32* %103, i64 %105
  %107 = load i32, i32* %106, align 4
  %108 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %107)
  br label %109

; <label>:109:                                    ; preds = %99
  %110 = load i32, i32* %15, align 4
  %111 = add nsw i32 %110, 1
  store i32 %111, i32* %15, align 4
  br label %96

; <label>:112:                                    ; preds = %96
  %113 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
  br label %114

; <label>:114:                                    ; preds = %112
  %115 = load i32, i32* %14, align 4
  %116 = add nsw i32 %115, 1
  store i32 %116, i32* %14, align 4
  br label %92

; <label>:117:                                    ; preds = %92
  %118 = load i8*, i8** %16, align 8
  call void @llvm.stackrestore(i8* %118)
  ret void
}

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #1

; Function Attrs: noreturn
declare void @exit(i32) #2

declare i32 @printf(i8*, ...) #3

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
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.1 (https://github.com/llvm-mirror/clang.git 3c8961bedc65c9a15cbe67a2ef385a0938f7cfef) (https://github.com/llvm-mirror/llvm.git c8fccc53ed66d505898f8850bcc690c977a7c9a7)"}
