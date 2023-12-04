distance(particle, position::CartesianIndex) = √((particle.x - position[1])^2 + (particle.y - position[2])^2)

function measure_probability(img, particles)
    points = findall(Bool.(img))
    weights = [1 / (1 + minimum(pos -> distance(p, pos), points)) for p in particles]
    weights = weights ./ sum(weights)
    cumulative = cumsum(weights)
    return weights, cumulative
end