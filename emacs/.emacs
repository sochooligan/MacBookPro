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

(menu-bar-mode -1)			; 关闭 menu bar
(global-display-line-numbers-mode 1) 	; 全局开启行号
(column-number-mode t) 			; 显示列号

(winner-mode t)				; 记录历史窗口, 可以来回跳转

(defun kill-current-buffer()		; 直接关闭当前的缓冲区，不询问
  (interactive)
  (kill-buffer (current-buffer)))
(global-set-key (kbd "C-x k") 'kill-current-buffer)

(setq scroll-step 1)			; 当行位于最上和最下，滚动时不跳到屏幕中间，而时只移动一行
;;(setq auto-save-default nil)            ; 当文件未保存就关闭时，生成一个包含关闭时内容的 #号开头的文件
(setq-default fill-column 77)		; 每行 77 个字符


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

;; eshell 缩减路径
(setq eshell-prompt-function
      (lambda ()
	(concat (propertize (format-time-string "%H:%M %d-%m " (current-time))
			    'face `(:foreground "yellow"))
		(propertize (car (last (split-string (eshell/pwd) "/")))
			    'face `(:foreground "brightblue"))
		(propertize "/" 'face `(:foreground "brightblue"))
		(if (= (user-uid) 0) " # " " $ "))))
