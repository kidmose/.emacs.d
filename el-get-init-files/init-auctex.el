; AucTex
;; Always latex-mode for tex files
(add-to-list 'auto-mode-alist '("\\.tex\\'" . latex-mode))
;; Parse files for identifying BIBTeX, autocomplete etc. 
(setq TeX-auto-save t) ; parse when saving
(setq TeX-parse-self t); parse when loading
;; Multifile documents
(setq-default TeX-master nil) ; Query for master file if not already set or read from file/directory variables
;; work around an emacs 24.3 ispell bug
; https://lists.gnu.org/archive/html/bug-auctex/2013-12/msg00010.html
(add-hook 'TeX-mode-hook (lambda ()
			   (setq-local comment-padding " ")))
;; (load "preview-latex.el" nil t t)

(setq TeX-PDF-mode t); pdf output by default


; RefTeX
(add-hook 'latex-mode-hook 'turn-on-reftex)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
;(add-hook 'TeX-mode-hook #'(lambda ()
;                             (setq-local comment-padding " ")))
(setq reftex-plug-into-auctex t)

; Synctex
(customize-set-variable TeX-source-correlate-mode t)

; Evince
;; ;; Evince as pdf-viewer with two way search using dbus
;; ;http://www.emacswiki.org/emacs/AUCTeX#toc20
;; (require 'dbus)

;; (defun un-urlify (fname-or-url)
;;   "A trivial function that replaces a prefix of file:/// with just /."
;;   (if (string= (substring fname-or-url 0 8) "file:///")
;;       (substring fname-or-url 7)
;;     fname-or-url))

;; (defun th-evince-sync (file linecol &rest ignored)
;;   (let* ((fname (un-urlify file))
;;          (buf (find-buffer-visiting fname))
;;          (line (car linecol))
;;          (col (cadr linecol)))
;;     (if (null buf)
;;         (message "[Synctex]: %s is not opened..." fname)
;;       (switch-to-buffer buf)
;;       (goto-line (car linecol))
;;       (unless (= col -1)
;;         (move-to-column col)))))

;; (defvar *dbus-evince-signal* nil)

;; (defun enable-evince-sync ()
;;   (require 'dbus)
;;   (when (and
;;          (eq window-system 'x)
;;          (fboundp 'dbus-register-signal))
;;     (unless *dbus-evince-signal*
;;       (setf *dbus-evince-signal*
;;             (dbus-register-signal
;;              :session nil "/org/gnome/evince/Window/0"
;;              "org.gnome.evince.Window" "SyncSource"
;;              'th-evince-sync)))))

;; (add-hook 'LaTeX-mode-hook 'enable-evince-sync)

;; ;(setq-default TeX-master nil); ask for master when opening tex files
;; (put 'upcase-region 'disabled nil)


;;; Okular as pdfviewer with fwd and rev search
;; (customize-set-variable TeX-source-correlate-method (quote synctex))
;; (customize-set-variable TeX-source-correlate-mode t)
;; (customize-set-variable TeX-source-correlate-start-server t)
;; (customize-set-variable TeX-view-program-list (quote (("Okular" "okular –unique %o#src:%n%b"))))
;; (customize-set-variable TeX-view-program-selection (quote (((output-dvi style-pstricks) "dvips and gv") (output-dvi "xdvi") (output-pdf "xpdf") (output-html "xdg-open") (output-pdf "Okular"))))
