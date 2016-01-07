

syntax match rsCppTypeName "\v((class|struct)\s+)@<=\w+"
syntax match rsCppTypeName "\v(\<\s*)@<=\w+(\s*\>)@="
hi link rsCppTypeName GruvboxFg4
