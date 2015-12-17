yigin	segment para stack 'yigin'
		dw 12 dup(?)
yigin	ends
veri	segment para 'veri'
dizib	db 0ffh,1,2,3,4
eleman	dw 5
toplam	dw 0
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
		xor si,si
l1:		add al,dizib[si]
		adc ah,0	; carry degerini unutmadýk
		inc si		; dizi byte indis tek artar
		loop l1
		mov toplam,ax
		ret
topla	endp
kod		ends
		end topla
		
		