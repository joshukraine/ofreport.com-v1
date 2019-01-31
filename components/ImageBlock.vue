<template lang="pug">
figure.image-block.text-center.my-12(v-editable="segment")
  a(v-if="segment.link" :href="segment.link")
    img(
      :src="segment.src"
      :class="segment.classes"
      :alt="segment.caption")
  img(
    v-else
    :src="segment.src"
    :class="segment.classes"
    :alt="segment.caption")
  .max-w-md.mx-auto(v-if="segment.caption")
    figcaption.font-bold {{ segment.caption }}
</template>

<script>
export default {
  props: ['segment']
}
</script>
