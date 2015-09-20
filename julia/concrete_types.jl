@assert typeof(3) == Int64
@assert typeof(0x22) == Uint8
@assert typeof(0xFA31) == Uint16
@assert typeof(false) == Bool
@assert typeof('é') == Char
@assert typeof("Hello") == ASCIIString
@assert typeof("C = 2πr") == UTF8String
@assert typeof(:hello) == Symbol
@assert typeof(r"\d+(\.\d+)") == Regex
@assert typeof(Float64) == DataType
@assert typeof(DataType) == DataType