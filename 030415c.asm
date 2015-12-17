mystack	segment para stack 'stack'
		dw 12 dup (?)
mystack	ends
mydata	segment para 'data'
sayi1 	dd 0aabbccddh
sayi2	dd 66554433h
sonuc	dq 0			; sayi1 ve sayi2 toplamý burada olusur.
mydata 	ends
mycode	segment para 'code'
		assume cs:mycode, ss:mystack, ds:mydata
toplam	proc far 
		push ds
		xor ax,ax
		push ax		; dönüs adreslerini yigina koyar
		mov ax,mydata
		mov ds,ax	; kendi veri alanima erisebilir oldum.
		lea si,sayi1
		lea di,sayi2
		lea bx,sonuc; verilere dizi tip kotrolü olmadan dizi 
					; gibi eriþmek istiyoruz.
		xor dx,dx
		mov ax,[si]
		add ax,[di]
		mov [bx],ax
		adc dx,0
		add dx,[si+2]
		add dx,[di+2]
		mov [bx+2],dx
		adc word ptr [bx+4],0000h
		ret
toplam	endp
mycode	ends
		end toplam