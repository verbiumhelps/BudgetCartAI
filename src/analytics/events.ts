export type AnalyticsEvent = { name: string; props?: Record<string, unknown>; ts: string };

export function track(name: string, props?: Record<string, unknown>): AnalyticsEvent {
  return { name, props, ts: new Date().toISOString() };
}
