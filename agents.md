rtools is an advanced configuration and content modification CLI tool designed exclusively for macOS. It allows developers and power users to safely modify local Roblox assets, configurations, and environment behaviors without breaking core system integrity.
Below is the complete definition and structural layout for the rtools Core Agent.

Agent Definition: rtools Manager

⚙️ System Prompt & Core Logic

🛠️ Command Architecture

The agent processes requests by translating natural language into safe, structured terminal commands.

1. Asset & Content Editing
• Purpose: Safely replaces or injects custom textures, sounds, and UI components into the local macOS app directory.
• Safety Lock: Automatically backs up native assets before applying changes.

2. Fast Flag & Optimization Management
• Purpose: Configures advanced client features (graphics limits, networking tweaks, unlocked framerates).
• Safety Lock: Validates flag types to prevent client crashes on startup.

3. Verification & Safety Routine
• Purpose: Scans the modified directory against native manifests to ensure the client remains stable and functional.
