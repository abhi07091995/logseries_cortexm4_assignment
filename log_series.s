	 area     appcode, CODE, READONLY
     export __main
	 ENTRY 

__main  function
       VLDR.f32  s15, =15	; value whose logarithm series value to be find here
       VMOV.f32  s16, s15   ; creating a register for storing the accumulated result named as s16
	   VLDR.f32  s17,= 2
       VSQRT.f32 s17,s17   ; finding square root of s17
       VDIV.f32  s18,s16,s17
       VFMS.f32  s16,s18,s18 ;  result 
	   VMOV.f32  s9, s15
	   VMOV.f32  s19, s15
	   VLDR.f32  s20,= 3  ; constant to be incremented for denominator
	   VSQRT.f32 s2,s20  ; here storing square root of s20
	   VLDR.f32  s21,=1

L1  VDIV.f32     s1,s19,s2  
	   VMUL.f32  s8,s1,s1  ;  finding square value of s1 and stored in s8
       VFMA.f32  s16,s9,s8  ; result stored in s16
	   VADD.f32  s20,s20,s21 ; increment s20 by s21
	   VSQRT.f32 s2,s20
	   VMUL.f32  s9,s9,s15
	   B L2

L2  VDIV.f32     s1,s19,s2
       VMUL.f32  s8,s1,s1 ;  finding square value of s1 and stored in s8
	   VFMS.f32  s16,s9,s10	; result stored in s16
	   VADD.f32  s20,s20,s21 ; increment s20 by s21
	   VSQRT.f32 s2,s20		;here storing square root of s20
	   VMUL.f32  s9,s9,s15
	   B L1

     endfunc
     end
