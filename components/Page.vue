<template lang="pug">
div(v-editable="blok" class="page")
  component(
    v-for="blok in blok.segments"
    :key="blok._uid"
    :blok="blok"
    :is="blok.component")
</template>

<script>
export default {
  props: ['blok']
}
</script>
