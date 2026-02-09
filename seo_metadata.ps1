# Script to add SEO meta tags to multiple blog posts
# Blog post metadata
$blogPosts = @(
    @{
        file = "blog/using-free-ai-models.html"
        title = "Building with Free AI Models: A Practical Guide"
        description = "Learn how to build production apps with free AI models including DeepSeek, Gemini, and more. Complete guide with code review assistant example, architecture diagrams, and prompts."
        keywords = "free AI models, DeepSeek, Gemini, Google AI, code review, AI development, LLMs, open source AI"
        date = "2026-02-07"
        tags = @("AI", "Development", "Free Tools", "LLMs")
    },
    @{
        file = "blog/machine-learning.html"
        title = "Machine Learning Explained: A 2026 Guide"
        description = "A comprehensive guide to Machine Learning types: Supervised, Unsupervised, Reinforcement, and Semi-supervised learning with examples and diagrams."
        keywords = "machine learning, supervised learning, unsupervised learning, reinforcement learning, AI basics, ML tutorial"
        date = "2026-02-07"
        tags = @("Machine Learning", "AI", "Tutorial")
    },
    @{
        file = "blog/context-compression.html"
        title = "Context Compression in AI Models: How LLMs Handle Long Conversations (2026)"
        description = "Deep dive into context compression techniques used by Claude, GPT, Gemini, and other AI models to handle long conversations and massive documents."
        keywords = "context compression, LLM context, Claude, GPT, Gemini, AI context window, prompt caching"
        date = "2026-02-07"
        tags = @("AI", "LLMs", "Context Management")
    },
    @{
        file = "blog/token-limits.html"
        title = "AI Model Token Limits Compared (2026 Update)"
        description = "Updated comparison of token limits across major AI models including Claude, GPT, Gemini, and DeepSeek. Find the best model for your use case."
        keywords = "AI token limits, Claude tokens, GPT tokens, Gemini context, DeepSeek, AI model comparison"
        date = "2026-02-07"
        tags = @("AI", "LLMs", "Comparison")
    }
)

Write-Host "Blog posts to update:" -ForegroundColor Cyan
$blogPosts | ForEach-Object { Write-Host "  - $($_.title)" }
Write-Host ""
Write-Host "Run individual update commands for each..."
