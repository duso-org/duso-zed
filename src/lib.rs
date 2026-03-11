use zed_extension_api as zed;

pub struct DusoExtension;

impl zed::Extension for DusoExtension {
    fn new() -> Self {
        Self
    }

    fn language_server_command(
        &mut self,
        _language_server_id: &zed::LanguageServerId,
        worktree: &zed::Worktree,
    ) -> Result<zed::Command, String> {
        let duso_binary = worktree
            .which("duso")
            .ok_or_else(|| "duso binary not found in PATH".to_string())?;

        Ok(zed::Command {
            command: duso_binary,
            args: vec!["-lsp".to_string()],
            env: Default::default(),
        })
    }
}

zed::register_extension!(DusoExtension);
