global zigzag_scan
extern print_array

section .data
length dd 64

section .text

zigzag_scan:
    push ebp            ;Début prologue
    mov ebp, esp        ;Fin prologue stackframe
    
    mov ebx, [ebp+8]    ;Récupération du premier argument (Array Source)
    mov eax, [ebp+12]   ;Récupération du second argument  (Array Dest)
    mov ecx, 0          ;Initialisation du compteur à 0 pour placer (Index de position dans le tableau dest)
main:
    call append         ;Ajoute le premier élément au tableau
    call part1          ;ZigZag premiere moitié du tableau
    call part2          ;Zigzag deuxième moitié du tableau
    call dright         ;Append du dernier élement
    mov ebx, [length]
    push ebx
    push eax
    call print_array
    jmp epi             

;------------------------------------------------------------

append:                 ;Fonction Append
    push ebp
    mov ebp, esp
    mov edx, [ebx]      ;Place la valeur pointée du tableau source dans un registre edx
    mov [eax+ecx], edx  ;Place la valeur du registre edx dans le tableau dest
    pop ebp
    ret

dright:                 ;Fonction qui place dans dans ebx la valeur qui se trouve en déplacement droite
    push ebp
    mov ebp, esp
    add ebx, 1
    inc ecx             
    call append
    pop ebp
    ret

ddown:                  ;Fonction qui place dans dans ebx la valeur qui se trouve en déplacement bas
    push ebp
    mov ebp, esp
    add ebx, 8
    inc ecx             
    call append
    pop ebp
    ret


diagdown:               ;Fonction qui place dans dans ebx la valeur qui se trouve en déplacement diagonal bas
    push ebp
    mov ebp, esp
    add ebx, 7
    inc ecx             
    call append
    pop ebp
    ret

diagup:                 ;Fonction qui place dans dans ebx la valeur qui se trouve en déplacement diagonal haut
    push ebp
    mov ebp, esp
    sub ebx, 7
    inc ecx            
    call append 
    pop ebp
    ret

;------------------------------------------------------------

epi:
    mov esp, ebp        ;Début épilogue réallocation d'esp
    pop ebp             
    ret                 ;Fin épilogue

;------------------------------------------------------------

part1:                  
    push ebp            ;Prologue fonction part1
    mov ebp, esp
    mov edi, 1          ;Initialisation d'un compteur qui va s'incrémenter jusqu'à 7
checkparity1:    
    test edi, 1         ;Vérification de la parité
    jnz odd1
    test edi, 0
    jp even1
endpart1:               
    mov esp, ebp        ;Epilogque fonction part1
    pop ebp
    ret
odd1:                   ;Si impair
    mov esi, 0          ;Initialisation du nombre d'itération esi à 0
    call dright
iter1:
    call diagdown
    add esi, 1          ;Incrémentation du compteur esi
    cmp esi, edi        ;Compare avec le compteur pour savoir s'il faut briser la boucle
    jl iter1
    add edi, 1          ;Incrémentation du compteur esi
    cmp edi, 7          ;Compare avec le compteur pour savoir s'il faut briser la boucle
    jle checkparity1
    jmp endpart1
even1:                  ;Si pair
    mov esi, 0          ;Initialisation du nombre d'itération esi à 0
    call ddown
iter2:
    call diagup
    add esi, 1          ;Incrémentation du compteur esi
    cmp esi, edi        ;Compare avec le compteur pour savoir s'il faut briser la boucle 
    jl iter2
    add edi, 1          ;Fin de la boucle, incrémentation de edi
    jmp checkparity1

;------------------------------------------------------------

part2:                  
    push ebp            ;Prologue fonction part2
    mov ebp, esp
    sub edi, 2          ;Initialisation du compteur edi à 6 qui va se décrémenter jusqu'à 1
checkparity2:    
    test edi, 1         ;Verifie la parité
    jnz odd2
    test edi, 0
    jp even2
endpart2:    
    mov esp, ebp        ;Epilogque fonction part2
    pop ebp
    ret
even2:                  ;Si pair
    mov esi, 0          ;Initialisation du nombre d'itération esi à 0
    call dright
iter3:
    call diagup
    add esi, 1          ;Incrémentation du compteur esi
    cmp esi, edi        ;Compare avec le compteur pour savoir s'il faut briser la boucle 
    jl iter3
    sub edi, 1          ;Fin de la boucle, décrémentation de edi
    jmp checkparity2
    jmp endpart2
odd2:                   ;Si impair
    mov esi, 0          ;Initialisation du nombre d'itération esi à 0
    call ddown
iter4:
    call diagdown
    add esi, 1          ;Incrémentation du compteur esi
    cmp esi, edi        ;Compare avec le compteur pour savoir s'il faut briser la boucle
    jl iter4
    sub edi, 1          ;Fin de la boucle, incrémentation de edi
    cmp edi, 1          ;Compare avec le compteur pour savoir s'il faut briser la boucle
    jge checkparity2
    jmp endpart2