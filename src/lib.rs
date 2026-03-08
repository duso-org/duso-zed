use zed_extension_api as zed;

pub struct DusoExtension;

impl zed::Extension for DusoExtension {
    fn new() -> Self {
        Self
    }

    fn language_server_command(
        &mut self,
        _language_server_id: &zed::LanguageServerId,
        _worktree: &zed::Worktree,
    ) -> Result<zed::Command, String> {
        Ok(zed::Command {
            command: "/usr/local/bin/duso".to_string(),
            args: vec!["-lsp".to_string()],
            env: Default::default(),
        })
    }
}

zed::register_extension!(DusoExtension);
