use proc_macro::*;

fn remove_marker_attr(input: TokenStream, ident: &str) -> TokenStream {
    use TokenTree as tt;
    input
        .into_iter()
        .scan(None, |state, x| match (state, x) {
            (pound @ None, tt::Punct(p)) if p.as_char() == '#' => {
                *pound = Some(tt::Punct(p));
                Some(vec![])
            }
            (p @ Some(_), tt::Group(g)) => match g.delimiter() {
                Delimiter::Bracket => match g.stream().into_iter().next() {
                    Some(tt::Ident(i)) if i.to_string() == ident => {
                        let _ = p.take();
                        Some(vec![])
                    }
                    Some(_) => Some(vec![p.take().unwrap(), tt::Group(g)]),
                    _ => Some(vec![tt::Group(g)]),
                },
                _ => Some(vec![p.take().unwrap(), tt::Group(g)]),
            },
            (None, tt::Group(g)) => Some(vec![tt::Group(Group::new(
                g.delimiter(),
                remove_marker_attr(g.stream(), ident),
            ))]),
            (_, x) => Some(vec![x]),
        })
        .flatten()
        .collect()
}

/// Attribute to guide code generation.
///
/// ## Attributes on struct fields
///
/// The following attributes are supported on struct fields:
///
///   - `#[frb(non_final)]` — do not mark the field in the corresponding
///     Dart struct as final.
///
#[proc_macro_attribute]
pub fn frb(_: TokenStream, item: TokenStream) -> TokenStream {
    remove_marker_attr(item, "frb")
}
