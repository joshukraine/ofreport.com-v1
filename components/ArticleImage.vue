<template lang="pug">
div.text-center.my-12(v-editable="segment")
  a(:href="segment.large")
    img.rounded(:src="segment.medium" :alt="segment.caption")
  .max-w-sm.mx-auto
    p.font-bold {{ segment.caption }}
</template>

<script>
export default{
  props: ['segment']
}
</script>
