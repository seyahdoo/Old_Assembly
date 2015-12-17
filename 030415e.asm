myss	segment para stack 'stack'
		dw 12 dup (?)
myss	ends
myds	segment para 'data'
eleman 	dw 10
dizi 	dw 0ffffh,1,2,3,4,5,6,7,8,9
toptek	dd 0
myds	ends
mycs	segment para 'code'
		assume cs:mycs, ss:myss, ds:myds
ana 	proc far
		push ds
		xor ax,ax
		push ax	; donus adresleri 
		mov ax,myds
		mov ds,ax	;veri alanina erisim 
		xor si,si
		mov cx,eleman
		lea bx,toptek
l1: 	mov ax, dizi[si]
		test ax,1 
		jz devam 
		add [bx],ax		; toptek'e ax ekle 
		adc  word ptr [bx+2],0	; carry olabilir unutma 
devam:	add si,2		; dizi word tipinde
		loop l1
		ret
ana		endp
mycs	ends	
		end ana 