yigin	segment para stack 'yigin'
		dw 12 dup(?)
yigin	ends
veri	segment para 'veri'
diziw	dw 0ffffh,1,2,3,4
eleman	dw 5
toplam	dd 0
veri	ends
kod		segment para 'ckod'
		assume cs:kod, ds:veri, ss:yigin
topla	proc far
		push ds
		xor ax,ax
		push ax 	; dönüþ adresleri sakladým
		mov ax,veri
		mov ds,ax	; veri alanina eriþtik. 
		xor ax,ax	; toplam deger ax de olacak 
		mov cx,eleman
		xor dx,dx	; toplam'ýn yüksek anlamlý wordunu tutar
		xor bx,bx	; dizi indisi 
l1:		add ax,diziw[bx]
		adc dx,0	; carry degerini unutmadýk
		add bx,2		; dizi byte indis tek artar
		loop l1
		lea bx,toplam
		mov [bx],ax		;düsük anlamlý word 
		mov [bx+2],dx	;yüksek anlamlý word 
		ret
topla	endp
kod		ends
		end topla
		
		