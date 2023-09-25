(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(magit)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(magit-section-highlight ((t (:extend t :background "color-25")))))

(menu-bar-mode -1)			; without menu bar
(global-display-line-numbers-mode 1) 	; 全局开启行号
(column-number-mode t) 			; 显示列号

(winner-mode t)				; 记录历史窗口, 可以来回跳转

(defun kill-current-buffer()		; 直接关闭当前的缓冲区，不询问
  (interactive)
  (kill-buffer (current-buffer)))
(global-set-key (kbd "C-x k") 'kill-current-buffer)

;; text mode and auto fill mode
(setq-default major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; c++mode选择对齐风格
(defun my-c++-mode-hook()
  (c-set-style "stroustrup"))
(setq-default major-mode 'c++-mode)
(add-hook 'c++-mode-hook 'my-c++-mode-hook) 

;; c-mode先择对齐风格
(defun my-c-mode-hook()
  (c-set-style "user"))
(setq-default major-mode 'c-mode)
(add-hook 'c-mode-hook 'my-c-mode-hook) 

(setq-default fill-column 77)		; 每行 77 个字符

;; eshell 缩减路径
(setq eshell-prompt-function
      (lambda ()
	(concat (propertize (format-time-string "%m-%d %H:%M " (current-time))
			    'face `(:foreground "brightyellow"))
		(propertize (car (last (split-string (eshell/pwd) "/")))
			    'face `(:foreground "brightblue"))
		(propertize "/" 'face `(:foreground "brightblue"))
		(if (= (user-uid) 0) " # " " $ "))))
