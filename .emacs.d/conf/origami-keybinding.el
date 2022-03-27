;;
;; KeyBind
;; 

;; #C-h :<DEL>/Backspace 
(define-key key-translation-map (kbd "C-h") (kbd"<DEL>"))


;; #C-x ? :Help
(define-key global-map (kbd "C-x ?") 'help-command)

;; #C-c l :Toggle-truncate-lines
(define-key global-map (kbd "C-c l") 'toggle-truncate-lines)
