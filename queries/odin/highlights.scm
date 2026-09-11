; extends

; Built-in cast functions → type.builtin
(call_expression
  function: (identifier) @type.builtin
  (#any-of? @type.builtin
    "u8" "u16" "u32" "u64" "u128"
    "i8" "i16" "i32" "i64" "i128"
    "f16" "f32" "f64"
    "bool" "byte" "rune" "string" "cstring" "rawptr"
    "int" "uint" "uintptr"
    "complex32" "complex64" "complex128"
    "quaternion64" "quaternion128" "quaternion256"
    "typeid" "any"))

; Simple type aliases → type.builtin
(const_declaration
  (identifier) @type
  "::"
  (identifier) @type.builtin
  (#any-of? @type.builtin
    "u8" "u16" "u32" "u64" "u128"
    "i8" "i16" "i32" "i64" "i128"
    "f16" "f32" "f64"
    "bool" "byte" "rune" "string" "cstring" "rawptr"
    "int" "uint" "uintptr"
    "complex32" "complex64" "complex128"
    "quaternion64" "quaternion128" "quaternion256"
    "typeid" "any"))
