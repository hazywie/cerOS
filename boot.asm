ORG 0x7C00       ; Bootloader'ın RAM'de yüklenme adresi

mov ah, 0x0E    ; BIOS'un ekrana yazma fonksiyonunu seç
mov al, 'H'
int 0x10        ; 'H'
mov al, 'e'
int 0x10        ; 'e'
mov al, 'l'
int 0x10        ; 'l'
mov al, 'l'
int 0x10        ; 'l'
mov al, 'o'
int 0x10        ; 'o'
mov al, ','
int 0x10        ; ','
mov al, ' '
int 0x10        ; ' '
mov al, 'O'
int 0x10        ; 'O'
mov al, 'S'
int 0x10        ; 'S'
mov al, '!'
int 0x10        ; '!'

; Kernel'i yükle
mov bx, 0x1000  ; Kernel'i RAM'de 0x1000 adresine yükle
mov dh, 3       ; Yüklenecek sektör sayısı
mov dl, 0       ; Boot edilen sürücü (floppy için 0)
call disk_load  ; Diskten kernel'i yükle

mov al, '>'
int 0x10
mov al, '>'
int 0x10
mov al, '>'
int 0x10
jmp 0x1000      ; Kernel'e atla

; Diskten veri yükleme rutini
disk_load:
    pusha
    mov ah, 0x02  ; BIOS disk okuma fonksiyonu
    mov al, dh    ; Okunacak sektör sayısı
    mov ch, 0     ; Silindir numarası
    mov dh, 0     ; Kafa numarası
    mov cl, 2     ; Başlangıç sektörü
    int 0x13      ; Disk okuma çağrısı
    jc disk_fail  ; Hata olursa başarısızlığı göster
    popa
    ret

disk_fail:
    mov al, 'E'
    int 0x10
    hlt

TIMES 510-($-$$) db 0  ; Boot sector'u 512 bayta tamamla
DW 0xAA55             ; Boot sector işareti
