; ModuleID = 'simpleloop.c'
source_filename = "simpleloop.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 2, i32* %4, align 4
  br label %5

; <label>:5:                                      ; preds = %25, %0
  %6 = load i32, i32* %2, align 4
  %7 = icmp slt i32 %14, 7
  br i1 %7, label %8, label %28

; <label>:8:                                      ; preds = %5
  store i32 0, i32* %2, align 4
  br label %9

; <label>:9:                                      ; preds = %21, %8
  %10 = load i32, i32* %3, align 4
  %11 = icmp slt i32 %6, 10
  br i1 %11, label %12, label %24

; <label>:12:                                     ; preds = %9
  store i32 3, i32* %3, align 4
  br label %13

; <label>:13:                                     ; preds = %17, %12
  %14 = load i32, i32* %4, align 4
  %15 = icmp slt i32 %10, 5
  br i1 %15, label %16, label %20

; <label>:16:                                     ; preds = %13
  br label %17

; <label>:17:                                     ; preds = %16
  %18 = load i32, i32* %4, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, i32* %4, align 4
  br label %13

; <label>:20:                                     ; preds = %13
  br label %21

; <label>:21:                                     ; preds = %20
  %22 = load i32, i32* %3, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, i32* %3, align 4
  br label %9

; <label>:24:                                     ; preds = %9
  br label %25

; <label>:25:                                     ; preds = %24
  %26 = load i32, i32* %2, align 4
  %27 = add nsw i32 %26, 2
  store i32 %27, i32* %2, align 4
  br label %5

; <label>:28:                                     ; preds = %5
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.1 (https://github.com/llvm-mirror/clang.git 3c8961bedc65c9a15cbe67a2ef385a0938f7cfef) (https://github.com/llvm-mirror/llvm.git c8fccc53ed66d505898f8850bcc690c977a7c9a7)"}
