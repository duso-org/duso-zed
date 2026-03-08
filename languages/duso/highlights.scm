;; Comments
(comment) @comment

;; Keywords
(if_statement "if" @keyword)
(if_statement "then" @keyword)
(if_statement "else" @keyword)
(if_statement "elseif" @keyword)
(if_statement "end" @keyword)
(while_statement "while" @keyword)
(while_statement "do" @keyword)
(while_statement "end" @keyword)
(for_statement "for" @keyword)
(for_statement "in" @keyword)
(for_statement "do" @keyword)
(for_statement "end" @keyword)
(function_declaration "function" @keyword)
(function_declaration "end" @keyword)
(return_statement "return" @keyword)
(break_statement "break" @keyword)
(continue_statement "continue" @keyword)

;; Control flow keywords
"try" @keyword
"catch" @keyword
"throw" @keyword
"var" @keyword
"raw" @keyword

;; Operators
"and" @keyword.operator
"or" @keyword.operator
"not" @keyword.operator

;; Built-in functions
(
  (identifier) @function.builtin
  (#any-of? @function.builtin
    "abs" "acos" "asin" "atan" "atan2" "append_file" "breakpoint" "busy" "ceil"
    "clamp" "contains" "context" "copy_file" "cos" "current_dir" "datastore"
    "decode_base64" "deep_copy" "doc" "encode_base64" "ends_with" "env" "exit"
    "exp" "fetch" "file_exists" "file_type" "filter" "find" "floor" "format_json"
    "format_time" "hash" "hash_password" "http_server" "include" "input" "join"
    "keys" "kill" "len" "list_dir" "list_files" "load" "log" "ln" "lower"
    "make_dir" "map" "markdown_ansi" "markdown_html" "max" "min" "move_file"
    "now" "parallel" "parse" "parse_json" "parse_time" "pi" "pop" "pow" "print"
    "push" "random" "range" "reduce" "remove_dir" "remove_file" "rename_file"
    "replace" "repeat" "require" "round" "run" "save" "shift" "sin" "sleep"
    "sort" "spawn" "split" "sqrt" "starts_with" "substr" "sys" "tan" "template"
    "throw" "tobool" "tonumber" "tostring" "trim" "type" "unshift" "upper"
    "uuid" "values" "verify_password" "watch" "write"
  )
)

;; Function calls
(function_call name: (identifier) @function)

;; Function declarations
(function_declaration name: (identifier) @function.definition)

;; Strings and templates
(string) @string
(string (template_expression) @variable)

;; Numbers
(number) @number

;; Boolean and nil constants
"true" @constant
"false" @constant
"nil" @constant

;; Variables
(identifier) @variable

;; Punctuation
"(" @punctuation.bracket
")" @punctuation.bracket
"[" @punctuation.bracket
"]" @punctuation.bracket
"{" @punctuation.bracket
"}" @punctuation.bracket
"," @punctuation.delimiter
"." @punctuation.delimiter
";" @punctuation.delimiter

;; Operators
"+" @operator
"-" @operator
"*" @operator
"/" @operator
"%" @operator
"=" @operator
"==" @operator
"!=" @operator
"<" @operator
">" @operator
"<=" @operator
">=" @operator
"+=" @operator
"-=" @operator
"*=" @operator
"/=" @operator
"%=" @operator
"?" @operator
":" @operator
"~" @operator
