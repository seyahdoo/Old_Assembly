yigin	segment para stack 'yigin'
		dw 12 dup(?)
yigin 	ends
veri	segment para 'veri'
eleman	dw 5
toplam	dw 0
dizib	db 0ffh,1,2,3,4
veri	ends
kod		segment para 'ckod'
		assume cs:kod, ds:veri, ss:yigin
topla	proc far
		push ds
		xor ax,ax
		push ax  	; d�n�� adresleri saklad�m
		mov ax,veri
		mov ds,ax	; veri alanina eri�tik. 
		xor ax,ax	; toplam deger ax de olacak 
		mov cx,eleman
		lea si,dizib 	; !!! AMAN D�KKAT BU HATAYA NEDEN OLUR
l1:		add al,dizib[si]; SI DA zaten EA var dizib[si] KULLANMA 
		adc ah,0	; carry degerini unutmad�k
		inc si		; dizi byte indis tek artar
		loop l1
		mov toplam,ax
		ret
topla	endp
kod		ends
		end topla
		
		