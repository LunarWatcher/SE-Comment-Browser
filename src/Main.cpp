#include <iostream>
#include "stackcpp/client.h"
#include "Controller.hpp"
#include <chrono>
#include <thread>
#include "spdlog/spdlog.h"
#include "spdlog/sinks/stdout_color_sinks.h"

void initApp() {
    auto mLogger = spdlog::stdout_color_mt("console");
    mLogger->info("Initializing API client...");

    stackcpp::client client { "leLG5k5gGMutSTDU7pLzXA((" };
    Core::Controller controller;
    stackcpp::uinteger_t remaining = 100u;
    // Main loop
    while(true) {
        auto newComments = client.comments(remaining).get();
        
        for (auto const& comment : newComments) {
            mLogger->info("{} - {}", comment.content_markdown(), comment.owner().name());
        }

        // This is also interruptable, so it can be stopped like a regular command-line app. 
        // This also serves as the main loop, and handles the API itself
        std::this_thread::sleep_for(std::chrono::seconds(30));
        
    }
}

// Minimal entry point 
int main() {
    initApp();

    return 0;
}
