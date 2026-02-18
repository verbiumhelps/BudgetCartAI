import type { AnalyticsEvent } from "./events";

type TrackFn = (event: AnalyticsEvent) => void;

const noop: TrackFn = () => {};
let impl: TrackFn = (event) => { void event; };

export const analytics = {
  setImplementation(fn: TrackFn) { impl = fn; },
  track(event: AnalyticsEvent) { (impl ?? noop)(event); },
};
