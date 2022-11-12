# Stars and Fireworks UI VFX

Implemented with Shuriken Particle System in **Unity 2021.3.10f1**

## Screenshots

### Table Of Content

- [Implementation](#implementation)
  - [Design UI Elements](#design-ui-elements)
  - [Install Plugin for Particle System in the UI](#install-plugin-for-particle-system-in-the-ui)

### Resources

- [Fireworks and Stars | Unity Tutorial by Jettelly](https://www.youtube.com/watch?v=mCM2BwZbuwY)
- [ParticleEffectForUGUI by Mob-Sakai](https://github.com/mob-sakai/ParticleEffectForUGUI)
- [Fireworks VFX by Aqsa Nadeem](https://www.youtube.com/watch?v=1o4PMeao9kA)
- [ShaderLab Blend](https://docs.unity3d.com/Manual/SL-Blend.html)

## Implementation

### Design UI Elements

- Design the UI elements in Affinity
  - Main Sign for the "Level Up" message
  - Glow effect around the Sign
  - Rays of Light behind teh Sign
  - Stars for the particle emitter
  - Circles for the fireworks emitters

### Install Plugin for Particle System in the UI

- Install the package using the github url from this repo https://github.com/mob-sakai/ParticleEffectForUGUI
- This will allow to render particles from the particle system in the UI Canvas, using a CanvasRenderer.
