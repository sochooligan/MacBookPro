** 备份原来的 .emacs文件
    mv ~/.emacs ~/.emacs.bak
** 建立软链接
    ln -s ~/Documents/codes/MacBookPro/emacs/.emacs ~/.emacs

** 将{回车符} 替换成 {.txt回车符}
(1) 替换命令:
        M-x replace-string  <ret>
    输入{回车符}:
        C-q 12 <ret>        <ret>
        (或者 C-q C-j       <ret>)
    输入{.txt回车符}:
        .txt
        C-q C-j             <ret>

** 输入一个<Tab>
    C-q Tab
    
** 
