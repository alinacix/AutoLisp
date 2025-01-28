; Program    27/09/2000 v1.0  (alinaci@gmail.com)
; Blok deðiþtirici
; Çizimdeki mevcut bloklarý seçilen bir blokla deðiþtiri.
;
; Block changer
; ---------------------------------------
(defun c:deg ()
   (princ "\nyeni nesne(new block) :")
   (setq nes1 (car (entsel)))
   (setq enes1 (entget nes1))
   (setq blname1 (assoc 2 enes1))

   (princ "\neski nesneler(old blocks):")
   (setq ssnes2	  
	  (ssget  '((-4 . "<OR")
;                      (0 . "TEXT")
                      (0 . "INSERT")
;                      (0 . "CIRCLE")
                (-4 . "OR>")
               )
      )
   )
;   (setq ssnes2 (ssget))
   (setq n1 0)
   (setq nn (sslength ssnes2))
   (while (< n1 nn)
      (progn
	     (princ n1)
         (setq nes2 (ssname ssnes2 n1))
         (setq enes2 (entget nes2))
         (setq blname2 (assoc 2 enes2))
         (setq ent1 (subst blname1 blname2 enes2))
         (entmod ent1)
		 (setq n1 (+ n1 1))
	  )
   )
   (princ)
)
(princ "\ndeg : Blok deðiþtirici(Block changer)")
; ---------------------------------------
(princ)
