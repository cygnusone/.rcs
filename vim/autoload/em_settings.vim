function! em_settings#hello()
    echom "Hello, world!"
endfunction

function! em_settings#settings()  
    return {
    \    'html': {
    \        'snippets': {
    \            '!': "html:5",
    \            '!!!': "<!DOCTYPE html>\n",
    \            '!!!4t':  "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n",
    \            '!!!4s':  "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">\n",
    \            '!!!xt':  "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n",
    \            '!!!xs':  "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\n",
    \            '!!!xxs': "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.1//EN\" \"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd\">\n",
    \            'c': "<!-- |${child} -->",
    \            'cc:ie6': "<!--[if lte IE 6]>\n\t${child}|\n<![endif]-->",
    \            'cc:ie': "<!--[if IE]>\n\t${child}|\n<![endif]-->",
    \            'cc:noie': "<!--[if !IE]><!-->\n\t${child}|\n<!--<![endif]-->",
    \            'html:4t': "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n"
    \                    ."<html lang=\"${lang}\">\n"
    \                    ."<head>\n"
    \                    ."\t<meta http-equiv=\"Content-Type\" content=\"text/html;charset=${charset}\">\n"
    \                    ."\t<title></title>\n"
    \                    ."</head>\n"
    \                    ."<body>\n\t${child}|\n</body>\n"
    \                    ."</html>",
    \            'html:4s': "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">\n"
    \                    ."<html lang=\"${lang}\">\n"
    \                    ."<head>\n"
    \                    ."\t<meta http-equiv=\"Content-Type\" content=\"text/html;charset=${charset}\">\n"
    \                    ."\t<title></title>\n"
    \                    ."</head>\n"
    \                    ."<body>\n\t${child}|\n</body>\n"
    \                    ."</html>",
    \            'html:xt': "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n"
    \                    ."<html xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"${lang}\">\n"
    \                    ."<head>\n"
    \                    ."\t<meta http-equiv=\"Content-Type\" content=\"text/html;charset=${charset}\" />\n"
    \                    ."\t<title></title>\n"
    \                    ."</head>\n"
    \                    ."<body>\n\t${child}|\n</body>\n"
    \                    ."</html>",
    \            'html:xs': "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\n"
    \                    ."<html xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"${lang}\">\n"
    \                    ."<head>\n"
    \                    ."\t<meta http-equiv=\"Content-Type\" content=\"text/html;charset=${charset}\" />\n"
    \                    ."\t<title></title>\n"
    \                    ."</head>\n"
    \                    ."<body>\n\t${child}|\n</body>\n"
    \                    ."</html>",
    \            'html:xxs': "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.1//EN\" \"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd\">\n"
    \                    ."<html xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"${lang}\">\n"
    \                    ."<head>\n"
    \                    ."\t<meta http-equiv=\"Content-Type\" content=\"text/html;charset=${charset}\" />\n"
    \                    ."\t<title></title>\n"
    \                    ."</head>\n"
    \                    ."<body>\n\t${child}|\n</body>\n"
    \                    ."</html>",
    \            'farts': "<!DOCTYPE html>\n"
    \                    ."<html lang=\"${lang}\">\n"
    \                    ."<hasdasdfasdfasdfasdfasdfasdffead>\n"
    \                    ."\t<meta charset=\"${charset}\">\n"
    \                    ."\t<title></title>\n"
    \                    ."</head>\n"
    \                    ."<body>\n\t${child}|\n</body>\n"
    \                    ."</html>",
    \        },
    \    },
    \}
endfunction
