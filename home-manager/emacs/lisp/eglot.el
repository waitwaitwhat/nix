;; Joe's dotfiles
;; Copyright (C) 2023  Josep Jesus Bigorra Algaba (jjbigorra@gmail.com)

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

(require 'eglot)
(add-to-list 'eglot-server-programs '(nix-ts-mode . ("nil")))
(add-to-list 'eglot-server-programs '(scala-ts-mode . ("metals")))
(add-to-list 'eglot-server-programs '(dart-mode . ("dart" "language-server" "--client-id" "emacs.eglot-dart" "--client-version" "1.2" "--protocol" "lsp")))

(add-hook 'before-save-hook 'eglot-format-buffer)
(add-hook 'before-save-hook 'my-eglot-organize-imports)

(setq-default eglot-workspace-configuration
              '(
                :metals (
			 :superMethodLensesEnabled t
			 :showInferredType t
			 )
                :haskell (
			  :formattingProvider "ormolu"
			  )
                )
              )
(setq eglot-autoshutdown t)
(setq eglot-confirm-server-initiated-edits nil)
(setq eglot-report-progress t)
(setq eglot-extend-to-xref t)
(setq eglot-autoreconnect t)


(add-hook 'eglot-managed-mode-hook
          (lambda ()
            ;; Show flymake diagnostics first.
            (setq eldoc-documentation-functions
                  (cons #'flymake-eldoc-function
                        (remove #'flymake-eldoc-function eldoc-documentation-functions)))
            ;; Show all eldoc feedback.
            (setq eldoc-documentation-strategy #'eldoc-documentation-compose)))
