using UnrealBuildTool;

public class RetailStoreTarget : TargetRules
{
	public RetailStoreTarget(TargetInfo Target) : base(Target)
	{
		DefaultBuildSettings = BuildSettingsVersion.V2;
		Type = TargetType.Game;
		ExtraModuleNames.Add("RetailStore");
	}
}
