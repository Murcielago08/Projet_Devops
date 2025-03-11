use reqwest::Error;
use tokio;
use std::process::{Command, Child};
use std::time::Duration;
use tokio::time::sleep;

async fn is_server_running() -> bool {
    reqwest::get("http://localhost:3000/")
        .await
        .is_ok()
}

async fn test_root_endpoint() -> Result<(), Error> {
    let response = reqwest::get("http://localhost:3000/").await?;
    println!("GET / response: {:?}", response.text().await?);
    Ok(())
}

async fn test_help_endpoint() -> Result<(), Error> {
    let response = reqwest::get("http://localhost:3000/help").await?;
    println!("GET /help response: {:?}", response.text().await?);
    Ok(())
}

async fn test_invalid_endpoint() -> Result<(), Error> {
    let response = reqwest::Client::new()
        .post("http://localhost:3000/ping")
        .send()
        .await;
    match response {
        Ok(resp) => println!("POST /ping response status: {:?}", resp.status()),
        Err(err) => println!("Error with POST /ping: {:?}", err),
    }
    Ok(())
}

async fn test_ping_endpoint() -> Result<(), Error> {
    let response = reqwest::get("http://localhost:3000/ping").await?;
    println!("GET /ping response: {:?}", response.text().await?);
    Ok(())
}

fn start_server() -> Child {
    Command::new("C:\\Program Files\\nodejs\\npm.cmd") // Update this path to the correct location of npm
        .arg("start")
        .spawn()
        .expect("Failed to start server")
}

#[tokio::main]
async fn main() -> Result<(), Error> {
    let mut server = start_server();
    sleep(Duration::from_secs(5)).await; // Wait for the server to start

    if !is_server_running().await {
        println!("Le serveur n'est pas en cours d'exécution sur http://localhost:3000");
        return Ok(());
    }

    if let Err(e) = test_root_endpoint().await {
        println!("Error testing root endpoint: {:?}", e);
    }
    if let Err(e) = test_help_endpoint().await {
        println!("Error testing help endpoint: {:?}", e);
    }
    if let Err(e) = test_invalid_endpoint().await {
        println!("Error testing invalid endpoint: {:?}", e);
    }
    if let Err(e) = test_ping_endpoint().await {
        println!("Error testing ping endpoint: {:?}", e);
    }

    server.kill().expect("Failed to kill server");
    Ok(())
}
