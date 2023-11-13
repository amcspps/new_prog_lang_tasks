use std::thread;

fn evaluate_expression(expr: &str, x: f64) -> f64 {
    match expr {
        "x^2+2*x+1" => x * x + 2.0 * x + 1.0,
        "x^3" => x * x * x,
        "2*x+3" => 2.0 * x + 3.0,
        _ => {
            println!("Unknown expression: {}", expr);
            0.0
        }
    }
}

fn main() {
    let expressions = vec!["x^2+2*x+1", "x^3", "2*x+3"];
    let points = vec![1.0, 2.0, 3.0];

    let handles: Vec<_> = expressions.into_iter().zip(points).map(|(expr, point)| {
        thread::spawn(move || {
            let result = evaluate_expression(expr, point);
            println!("Expression: {}, Point: {}, Result: {}", expr, point, result);
        })
    }).collect();

    for handle in handles {
        handle.join().unwrap();
    }
}