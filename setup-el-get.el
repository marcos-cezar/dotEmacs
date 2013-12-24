(add-to-list 'load-path (concat emacs-home "el-get/el-get"))
(require 'el-get)

(add-to-list 'el-get-recipe-path (concat emacs-home "el-get-user/recipes"))
(el-get 'sync)

(provide 'setup-el-get)
