import DiscordKitBot

@main
struct DiscordTranslationBot {
    static func main() async throws {
        let bot = Client(intents: .messages)
        
        bot.ready.listen { data in
            print("Logged in. Data: \(data).")
            
            try? await bot.registerApplicationCommands() {
                NewAppCommand("Test", description: "just a test", handler: { interaction in
                    try await interaction.reply("Hello, World!")
                })
            }
        }
    }
}
